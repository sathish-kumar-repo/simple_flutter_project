import 'package:flutter/material.dart';
import 'package:whatsapp/model/status_model.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: ListTile(
              leading: Container(
                width: 50.0,
                child: Stack(
                  children: [
                    ClipOval(
                      child: Image.network(
                        StatusData[1].pic,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: const Color(0xff25d366),
                            borderRadius: BorderRadius.circular(20.0)
                            // color: Theme.of(context).sec
                            ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              title: Text(
                "My Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Tab to add Status Update"),
            ))
          ],
        ),
        SizedBox(
          height: 30.0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text(
              "Recent Updates",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: StatusData.length,
            itemBuilder: (context, i) => Column(
              children: [
                const Divider(height: 0.1),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(StatusData[i].pic),
                  ),
                  title: Row(
                    children: [
                      Text(
                        StatusData[i].name,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  subtitle: Container(
                    child: Text(
                      StatusData[i].time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
