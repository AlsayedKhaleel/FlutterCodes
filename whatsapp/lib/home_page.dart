import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/chat_model.dart';
import 'package:whatsapp/fake_data.dart';
import 'package:whatsapp/messages_types.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WhatsAppHomePage());
  }
}

class WhatsAppHomePage extends StatelessWidget {
  final List<Chat> chats = chatsData.map((element) => Chat.fromJSON(element)).toList();
  WhatsAppHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.chat, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "WhatsApp",
          style: TextStyle(fontSize: 20, fontWeight: .bold),
        ),
        actions: [
          Row(
            children: [
              Icon(CupertinoIcons.camera),
              SizedBox(width: 10),
              Icon(CupertinoIcons.search),
              SizedBox(width: 5),
              Icon(CupertinoIcons.ellipsis_vertical),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            makeCustomeChat(icon: Icons.lock, chatName: "Locked Chats"),
            makeCustomeChat(icon: Icons.archive, chatName: "Archived"),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: chatsData.length,
              itemBuilder: (context, index) => makeChat(chats[index]),
            ),
          ],
        ),
      ),
    );
  }
}

// create normal Chats.
Widget makeChat(Chat chat) {
  return Padding(
    padding: .all(10),
    child: Row(
      crossAxisAlignment: .start,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(chat.imageURL), radius: 25),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              chat.chatName,
              style: TextStyle(fontWeight: .bold, fontSize: 20),
            ),
          ],
        ),
        Spacer(),
        Text(
          chat.arrivalTime,
          style: TextStyle(fontSize: 15, fontWeight: .bold),
        ),
      ],
    ),
  );
}




Widget makeChatContent(Chat chat) {
  return
      if (chat.type == MessagesTypes.gif.toString().split('.').last)
        Row(
          children: [Icon(Icons.gif), Text("GIF")])
      else if ()
}

// makes the 1st two customized chats.
Widget makeCustomeChat({required IconData icon, required String chatName}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.green),
        ),
        SizedBox(width: 10),
        Text(
          chatName,
          style: TextStyle(
            fontWeight: .bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
