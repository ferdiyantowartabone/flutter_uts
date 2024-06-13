import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [
    {'title': 'Judul', 'subtitle': 'asik'},
    {'title': 'Judul', 'subtitle': 'asik'},
  ];

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Percobaan Pertama',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
        elevation: 3,
        backgroundColor: Color.fromARGB(255, 2, 251, 106),
        actions: [
          Icon(
            Icons.logout,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.person,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          // Flexible untuk GridView
          Flexible(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(8, (index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
                  color: Colors.green,
                );
              }),
            ),
          ),
          // SizedBox untuk ListView dengan tinggi tetap
          SizedBox(
            height: 185, // Atur tinggi sesuai kebutuhan Anda
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    title: Text(items[index]['title']),
                    subtitle: Row(
                      children: [
                        Text(items[index]['subtitle']),
                        SizedBox(width: 5),
                        Icon(Icons.favorite, color: const Color.fromARGB(255, 255, 0, 0)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.black),
                      onPressed: () => _removeItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}