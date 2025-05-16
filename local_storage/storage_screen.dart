import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageScreen extends StatefulWidget {
  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _savedTexts = [];

  @override
  void initState() {
    super.initState();
    _loadSavedTexts();
  }

  Future<void> _loadSavedTexts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedTexts = prefs.getStringList('texts') ?? [];
    });
  }

  Future<void> _saveText() async {
    final prefs = await SharedPreferences.getInstance();
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _savedTexts.add(text);
    });

    await prefs.setStringList('texts', _savedTexts);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        title: Text('Local Storage',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveText,
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _savedTexts.isEmpty
                  ? Center(child: Text('No saved data yet.'))
                  : ListView.builder(
                itemCount: _savedTexts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.save),
                    title: Text(_savedTexts[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
