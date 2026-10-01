import 'package:flutter/material.dart';
import 'package:messanger/chat_model.dart';
import 'package:messanger/fake_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MessangerHomePage());
  }
}

class MessangerHomePage extends StatelessWidget {
  const MessangerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = chatsData
        .map((e) => ChatModel.fromJson(e))
        .toList();

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: makeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SearchBar(
                leading: const Icon(Icons.search),
                hintText: 'Search...',
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ), // Adjust the radius here
                  ),
                ),
                elevation: WidgetStateProperty.all(
                  0,
                ), // Optional: remove shadow
                backgroundColor: WidgetStateProperty.all(
                  Colors.grey[200],
                ), // Optional background color
              ),
            ),

            // Horizontal chats bar.
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => makeHChat(chats[index]),
                itemCount: chats.length,
              ),
            ),

            // the vertical chats.
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (c, i) => makeVChat(chats[i]),
              itemCount: chats.length,
            ),
          ],
        ),
      ),
    );
  }
}

// constructs the app's bar.
AppBar makeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 80,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: makeAppBarAvatars(
        color: const Color.fromARGB(255, 239, 233, 233),
        icon: Icons.menu_rounded,
        cradius: 0,
      ),
    ),
    title: Text(
      "Chats",
      style: TextStyle(fontWeight: .bold, fontSize: 30, color: Colors.black),
    ),
    actions: [
      makeAppBarAvatars(
        color: Colors.white,
        icon: Icons.camera_alt_rounded,
        cradius: 30,
      ),
      makeAppBarAvatars(color: Colors.white, icon: Icons.edit, cradius: 30),
    ],
  );
}

// build the actions in the appBar.
CircleAvatar makeAppBarAvatars({
  required Color color,
  required IconData icon,
  required double cradius,
}) {
  return CircleAvatar(
    backgroundColor: color,
    radius: cradius,
    child: Icon(icon, color: Colors.black),
  );
}

// build the online chat in the horizontal bar.
Widget makeHChat(ChatModel chat) {
  if (chat.isOnline!) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: .bottomRight,
            children: [
              // chat image.
              CircleAvatar(
                backgroundImage: NetworkImage(chat.imageURL!),
                radius: 35,
              ),

              // green dot status.
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          Text(
            chat.chatName!.split(" ").first,
            style: TextStyle(fontWeight: .bold, fontSize: 20),
          ),
          Text(
            chat.chatName!.split(" ").last,
            style: TextStyle(fontWeight: .bold, fontSize: 20),
          ),
        ],
      ),
    );
  } else {
    return Container(width: 0, height: 0);
  }
}

// build the vertical chats.
Widget makeVChat(ChatModel chat) {
  return Padding(
    padding: .all(10),
    child: Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(chat.imageURL!),
              radius: 35,
            ),
            if (chat.isOnline!)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            if (chat.isOnline! == false)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text(chat.lastSeenOnline!)),
                ),
              ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              chat.chatName!,
              style: TextStyle(fontWeight: .bold, fontSize: 20),
            ),
            Row(
              children: [
                // to wrap the text in a fixed area.
                SizedBox(
                  width: 150,
                  child: Text(
                    chat.messageContent!,
                    style: TextStyle(fontSize: 15, overflow: .ellipsis),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  chat.arrivalTime!,
                  style: TextStyle(fontWeight: .bold, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
