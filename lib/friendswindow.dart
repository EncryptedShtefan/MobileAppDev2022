import 'package:flutter/material.dart';

class Friendswindow extends StatefulWidget {
  const Friendswindow({Key? key}) : super(key: key);

  @override
  _FriendswindowState createState() => _FriendswindowState();
}

class _FriendswindowState extends State<Friendswindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: _buildList(),
    );
  }
}

Widget _buildList() {
  return ListView(
    children: [
      const SizedBox(width: double.infinity, height: 5),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "online",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
          )
        ],
      ),
      _tile('Lora', 'New York', Icons.people),
      _tile('Ken', 'Orlando', Icons.people),
      _tile('Sidney', 'New York', Icons.people),
      _tile('Sarah', 'Washington DC', Icons.people),
      _tile('Jhon', 'Ivanovo', Icons.people),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "offline",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
          )
        ],
      ),
      _tile('Lora', 'New York', Icons.people),
    ],
  );
}

ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Color.fromARGB(255, 218, 196, 213),
    ),
  );
}
