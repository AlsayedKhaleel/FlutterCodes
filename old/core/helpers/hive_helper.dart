import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  // The box will store all that data inside.
  static late final String userStorageBox;
  static final String skipOnboardingBox = "skipOnboardingBox";
  static final String _skipOnboardingKey = "skipOnboardingKey";

  static Future<bool> skipOnboarding() async {
    if (Hive.box(skipOnboardingBox).isEmpty) {
      await Hive.box(skipOnboardingBox).put(_skipOnboardingKey, true);
    }

    // I'm checking for isNotEmpty, to make the name of the function
    //  fits will with the return and the context.
    // If i should skip, it will read as 'skipOnboarding == true'
    return Hive.box(skipOnboardingBox).isNotEmpty;
  }
}
