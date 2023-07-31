import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => {_scaffoldKey.currentState!.openDrawer()},
            icon: const Icon(
              Icons.menu,
              size: 50,
            )),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.black54,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 100, left: 15),
                children: [
                  GestureDetector(
                    child: buildDrawerMenuItem('Home', Icons.home_filled),
                    onTap: () => {_showAlert(context, 'Home drawer clicked')},
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child:
                        buildDrawerMenuItem('Alarm', Icons.alarm_add_outlined),
                    onTap: () => {_showAlert(context, 'Alarm drawer clicked')},
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: buildDrawerMenuItem(
                        'Calendar', Icons.calendar_month_outlined),
                    onTap: () =>
                        {_showAlert(context, 'Calendar drawer clicked')},
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: buildDrawerMenuItem(
                        'Calculator', Icons.calculate_outlined),
                    onTap: () =>
                        {_showAlert(context, 'Calculator drawer clicked')},
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: buildDrawerMenuItem('Logout', Icons.logout),
                    onTap: () => {Navigator.pushNamed(context, '/login')},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'This is sample app for testing',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => {_showAlert(context, 'Clicked on Alarm')},
                  child: buildCard(Icons.access_alarm_outlined)),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () => {_showAlert(context, 'Clicked on Calculator')},
                  child: buildCard(Icons.calculate_outlined)),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () => {_showAlert(context, 'Clicked on Calendar')},
                  child: buildCard(Icons.calendar_month_outlined)),
            ],
          )
        ]),
      ),
    );
  }

  Row buildDrawerMenuItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    );
  }

  Container buildCard(IconData icon) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(5)),
        child: SizedBox(
            height: 50,
            width: 50,
            child: Icon(
              icon,
              size: 50,
              color: Colors.green,
            )));
  }
}

void _showAlert(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
