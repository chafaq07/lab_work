import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'Mobile App Development',
      'teacher': 'Mr. Nabeel Akram',
      'credits': 3,
    },
    {
      'name': 'Data Structures',
      'teacher': 'Mr. Hassan Iftikhar',
      'credits': 4,
    },
    {
      'name': 'Operating Systems',
      'teacher': 'Mr. Shahzad Nazir',
      'credits': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        title: Text('Student Home' ,style: TextStyle(
            fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        ),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Welcome, Student!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/uni.jpg',
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Expanded(child: buildSubjectListView()),
          ],
        ),
      ),
    );
  }

  /// 🔽 Function to build the scrollable subject list
  Widget buildSubjectListView() {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(Icons.book, color: Colors.blue),
            title: Text(subject['name']),
            subtitle: Text('Instructor: ${subject['teacher']}'),
            trailing: Text('${subject['credits']} Cr'),
          ),
        );
      },
    );
  }
}
