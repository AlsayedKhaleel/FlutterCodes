#include <SoftwareSerial.h>        /* for bluetooth controlling. */
SoftwareSerial BTController(9, 8); /* Tx(9), Rx(8) */

#include <Servo.h> /* for servo control. */
Servo fireHose;    /* used object to control the servo motor. */

/* Left motor pair pins. */
#define LF_PIN 2 /* forward.  */
#define LE_PIN 3 /* the speed enable. */
#define LB_PIN 4 /* backward. */

/* Right motor pair pins. */
#define RE_PIN 5 /* the speed enable */
#define RF_PIN 6 /* forward.  */
#define RB_PIN 7 /* backward. */

/* LEDs & other devices pins. */
#define WATER_PUMP_PIN 10   /* the water pump to extinguish fires. */
#define DANGER_STATE_PIN 12 /* red LED.   */
#define BEEP_PIN 12         /* connected directly with the red LED, i have no pins :-) */
#define SAVE_STATE_PIN 11   /* green one. */
#define SERVO_PIN 13        /* servo's pin. */

/* flame sensors pins. */
#define LFS_PIN A0 /* left flame sensor. */
#define MFS_PIN A1 /* left flame sensor. */
#define RFS_PIN A2 /* left flame sensor. */

#define FIRE_DETECTED_LIMIT 800
#define FIRE_CLOSE 250

char movingDirection = 'S'; /* the char sent from the bluetoolth module. */

void setup() {

  /* All the digital PINs we have are output, except the 8, 9 for the bluetooth.
    motors & their enables,
      left : Enable(3), Forward(2), Backward(4),
      right: Enable(5), Forward(6), Backward(7);
    other devices,
      servo(13), water pump(10), buzzer(12), LEDs(red:12, green: 11),
 */
  for (short i = 3; i < 13; i++)
  {
    if (i == 8 || i == 9)
      continue;

    pinMode(i, OUTPUT);
  }

  /* save state by default. */
  digitalWrite(SAVE_STATE_PIN, HIGH);

  /* Serial & bluetooth intitation. */
  Serial.begin(9600);
  BTController.begin(9600);

  /* assoctiate the servo with its pin. */
  fireHose.attach(SERVO_PIN);
  fireHose.write(100); /* default servo's angle. */

  /* Fire sensors are inputs to the arduino. */
  pinMode(LFS_PIN, INPUT);
  pinMode(MFS_PIN, INPUT);
  pinMode(RFS_PIN, INPUT);

  /* the initial speed of the motors. */
  analogWrite(LE_PIN, 200);
  analogWrite(RE_PIN, 200);
}

short lsensor, msensor, rsensor; /* sensors' values. */
bool fireDetected;               /* fire had been detected. */
bool allowBluetoothCtrl = true;

void loop() {
  /* read sensors' analog signals. */
  lsensor = analogRead(LFS_PIN);
  msensor = analogRead(MFS_PIN);
  rsensor = analogRead(RFS_PIN);

  /* for debugging. */
  Serial.println(lsensor);
  Serial.println(msensor);
  Serial.println(rsensor);

  /* compare with the fire threshuold. */
  fireDetected = (lsensor < FIRE_DETECTED_LIMIT || msensor < FIRE_DETECTED_LIMIT || rsensor < FIRE_DETECTED_LIMIT);

  if (fireDetected) {
    danger();
    fireFighting(minSensorReading(lsensor, msensor, rsensor));
    save();
  } else {
    save();
  }

  if (allowBluetoothCtrl)
  {
    if (BTController.available())
    {
      /* the control using bluetooth. */
      movingDirection = BTController.read();
      Serial.println(movingDirection); // for debugging

      switch (movingDirection)
      {
        case 'F':
          runForward();
          break;
        case 'B':
          runBackward();
          break;
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'Y':
          beeeeep(HIGH);
          beeeeep(LOW);
          break;
        case 'S':
          stop();
          break;
        default:
          stop();
          break;
      }
    }
  }
}

/* runForward: make the car runs forward in a straight line. */
void runForward()
{
  /* enable the forward. */
  digitalWrite(RF_PIN, HIGH);
  digitalWrite(LF_PIN, HIGH);

  /* disable the backward. */
  digitalWrite(LB_PIN, LOW);
  digitalWrite(RB_PIN, LOW);
}

/* runBackward: make the car runs backward in a straight line. */
void runBackward()
{
  /* enable the forward. */
  digitalWrite(RF_PIN, LOW);
  digitalWrite(LF_PIN, LOW);

  /* disable the backward. */
  digitalWrite(LB_PIN, HIGH);
  digitalWrite(RB_PIN, HIGH);
}

/* turnRight: rotate the car's body about the axis to the right side. */
void turnRight()
{
  /* left pair will move forward & the right one will move backward.  */
  digitalWrite(LF_PIN, HIGH);
  digitalWrite(RB_PIN, HIGH);

  /* disable the other directions of both sides. */
  digitalWrite(RF_PIN, LOW);
  digitalWrite(LB_PIN, LOW);
}

/* turnLeft: rotate the car's body about the axis to the left side. */
void turnLeft()
{
  /* right pair will move forward & the left one will move backward.  */
  digitalWrite(RF_PIN, HIGH);
  digitalWrite(LB_PIN, HIGH);

  /* disable the other directions of both sides. */
  digitalWrite(LF_PIN, LOW);
  digitalWrite(RB_PIN, LOW);
}

/* stop: stop the car in its position. */
void stop()
{
  /* stop both pairs of motors. */
  digitalWrite(RF_PIN, LOW);
  digitalWrite(LB_PIN, LOW);
  digitalWrite(LF_PIN, LOW);
  digitalWrite(RB_PIN, LOW);
}

/* beeeeep: guss what this one does :-) */
void beeeeep(char signal)
{
  digitalWrite(BEEP_PIN, signal);
  if (signal == HIGH)
    delay(500);
}

/* save: called when we got no fire. */
void save()
{
  allowBluetoothCtrl = true;
  digitalWrite(DANGER_STATE_PIN, LOW);
  digitalWrite(WATER_PUMP_PIN,   LOW);
  digitalWrite(SAVE_STATE_PIN, HIGH);
  fireHose.write(100); /* default servo's angle. */
}

/* danger: called if the fire is too close. */
void danger()
{
  allowBluetoothCtrl = false;
  digitalWrite(SAVE_STATE_PIN, LOW);
  digitalWrite(DANGER_STATE_PIN, HIGH);
  stop();
}

/* fireFighting: controls the servo & water pump. */
void fireFighting(char firePosition)
{
  int angle = 0;
  switch (firePosition)
  {
    /* right target from angle 70 to 0 */
    case 'R':
    case 'r':
      /* from the front to the most right. */
      for (angle = 100; angle > 0; angle -= 10)
      {
        /* pump logic will be here. */
        fireHose.write(angle);
        delay(200);
      }

      /* the other direction. */
      for (; angle <= 100; angle += 10)
      {
        /* pump logic will be here. */
        fireHose.write(angle);
        delay(200);
      }
      break;

    /* mid target from angle 140 to 70 */
    case 'M':
    case 'm':
      for (angle = 140; angle > 70; angle -= 10)
      {
        /* pump logic will be here. */
        fireHose.write(angle);
        delay(200);
      }
      for (; angle <= 140; angle += 10)
      {
        /* pump logic will be here. */
        fireHose.write(angle);
        delay(200);
      }
      break;

    /* left target from angle 100 to 180 */
    case 'L':
    case 'l':
      for (angle = 100; angle <= 180; angle += 10)
      {
        /* pump logic will be here. */
        fireHose.write(angle);
        delay(200);
      }
      for (; angle > 100; angle -= 10)
      {
        /* pump logic will be here. */
        fireHose.write(angle);
        delay(200);
      }
      break;
    default:
      break;
  }
}

/* minSensorReading: compare the sensors' reading & get the direction of the lowest. */
char minSensorReading(short ls, short ms, short rs)
{
  if (ls < ms && ls < rs)
    return 'L';
  else if (ms < ls && ms < rs)
    return 'M';
  else if (rs < ms && rs < ls)
    return 'R';
  else
    return '\0';
}

/* waterPumpCtrl: to turn on/off the water pump. */
void waterPumpCtrl(bool enable)
{
  if (enable)
    digitalWrite(WATER_PUMP_PIN, HIGH);
  else
    digitalWrite(WATER_PUMP_PIN, LOW);

}