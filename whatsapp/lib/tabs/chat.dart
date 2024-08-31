import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat_model.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatsData.length,
        itemBuilder: (context, i) => Column(
              children: [
                const Divider(height: 0.1),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(chatsData[i].pic),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chatsData[i].name,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        chatsData[i].time,
                        style:
                            const TextStyle(fontSize: 11.0, color: Colors.grey),
                      )
                    ],
                  ),
                  subtitle: Text(
                    chatsData[i].msg,
                    style: const TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ));
  }
}
