import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xffB23121),
        secondary: const Color(0xffD44638),
        // Your accent color
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        title: const Text("Primary"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 180.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 25.0,
                ),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      backgroundImage: ExactAssetImage("assets/images/13.jpeg"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        "Sathish Kumar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        "Sathish@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            drawerListTile(
              idata: Icons.inbox,
              title: 'All inboxes',
              count: '',
              icolor: const Color(0xfffafafa),
            ),
            const Divider(height: 1.0),
            drawerListTile(
              idata: Icons.people,
              title: 'Primary',
              count: '99+',
              icolor: const Color(0xfffafafa),
            ),
            drawerListTile(
              idata: Icons.more,
              title: 'Social',
              count: '2 New',
              icolor: Colors.blue,
            ),
            drawerListTile(
              idata: Icons.star,
              title: 'Promotions',
              count: '',
              icolor: const Color(0xfffafafa),
            ),
            const Divider(height: 1.0),
            drawerListTile(
              idata: Icons.alarm,
              title: 'Starred',
              count: '2',
              icolor: const Color(0xfffafafa),
            ),
            drawerListTile(
              idata: Icons.play_arrow,
              title: 'Snoozed',
              count: '',
              icolor: const Color(0xfffafafa),
            ),
            drawerListTile(
              idata: Icons.mail_outline,
              title: 'Important',
              count: '99',
              icolor: const Color(0xfffafafa),
            ),
            drawerListTile(
              idata: Icons.bookmark,
              title: 'Sent',
              count: '9',
              icolor: const Color(0xfffafafa),
            ),
            drawerListTile(
              idata: Icons.insert_drive_file,
              title: 'Draft',
              count: '',
              icolor: const Color(0xfffafafa),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  do code for compose mail
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topTail(
              title: 'Social',
              subtitle: 'Google+',
              idata: Icons.people,
              icolor: Colors.blue,
              msg: '1 New',
            ),
            const Divider(height: 0.1),
            topTail(
              title: 'Promotions',
              subtitle: 'Swiggy, Google offers',
              idata: Icons.more,
              icolor: Colors.green,
              msg: '5 New',
            ),
            const Divider(height: 0.1),
            topTail(
              title: 'Updates',
              subtitle: 'Google Pay',
              idata: Icons.info,
              icolor: Colors.orange,
              msg: '2 New',
            ),
            const Divider(height: 0.1),
            msgTail(
              url: 'assets/images/1.jpg',
              name: "Sathish Kumar",
              msg: "Learn More Be Smart",
              logs: '1.45 PM',
              isUnread: false,
            ),
            msgTail(
              url: 'assets/images/2.jpg',
              name: "Reeghan",
              msg: "Hi Friend",
              logs: '1.25 PM',
              isUnread: false,
            ),
            msgTail(
              url: 'assets/images/3.jpg',
              name: "Sam",
              msg: "Welcome to my home",
              logs: '11.45 AM',
              isUnread: true,
            ),
            msgTail(
              url: 'assets/images/4.jpg',
              name: "Ram",
              msg: "Bye Friend",
              logs: 'Yesterday',
              isUnread: true,
            ),
            msgTail(
              url: 'assets/images/5.jpg',
              name: "Raja",
              msg: "New Offers to you",
              logs: 'Mar 8',
              isUnread: true,
            ),
          ],
        ),
      ),
    );
  }

  ListTile drawerListTile({
    required IconData idata,
    required String title,
    required String count,
    required Color icolor,
  }) {
    return ListTile(
      leading: Icon(idata),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            color: icolor,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 5.0,
            ),
            child: Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: icolor == const Color(0xfffafafa)
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile msgTail({
    required String url,
    required String name,
    required String msg,
    required String logs,
    required bool isUnread,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: ExactAssetImage(url),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(logs)
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(msg), const Icon(Icons.star_border)],
      ),
    );
  }

  ListTile topTail({
    required String title,
    required String subtitle,
    required IconData idata,
    required Color icolor,
    required String msg,
  }) {
    return ListTile(
      leading: Icon(
        idata,
        color: icolor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        color: icolor,
        child: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
