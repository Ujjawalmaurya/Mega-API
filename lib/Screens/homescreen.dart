import 'package:apis/Screens/Sections/health.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> sections = [
    "default",
    "Public API",
    "Kitchen Sink",
    "Athentication",
    "E-Commerce",
    "To Do List",
    "Social Media",
    "Chat App",
    "Databse Seeding",
    "Danger Zone",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: sections.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckHealth())),
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 28),
              child: Text(
                sections[index],
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        // ListTile(
        //   leading: Icon(Icons.api_rounded),
        //   title: Text("API - ${sections[index]}"),
        //   trailing: Icon(Icons.more_horiz),
        // ),
      ),
    );
  }
}
