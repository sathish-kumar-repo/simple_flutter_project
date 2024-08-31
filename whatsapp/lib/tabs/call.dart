import 'package:flutter/material.dart';
import 'package:whatsapp/model/call_model.dart';

class Call extends StatelessWidget {
  const Call({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) => Column(
              children: [
                const Divider(height: 0.1),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(callData[i].pic),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        callData[i].name,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        i % 2 == 0 ? Icons.call : Icons.videocam,
                        color: Color(0xff075e54),
                        // color: Theme.of(context).primaryColorDark,
                      )
                    ],
                  ),
                  subtitle: Text(
                    callData[i].time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                )
              ],
            ));
  }
}
