import 'package:flutter/material.dart';
// Import Monograph Details page
import 'package:monograph_management_system/Screens/MonographScreen/AddMonographPage.dart';
import 'package:monograph_management_system/Screens/MonographScreen/MonographDetails.dart';

class MonographManagementPage extends StatefulWidget {
  const MonographManagementPage({Key? key}) : super(key: key);

  @override
  _MonographManagementPageState createState() =>
      _MonographManagementPageState();
}

class _MonographManagementPageState extends State<MonographManagementPage> {
  List<String> monographs = []; // This should be a list of your monographs.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monograph Management'),
      ),
      body: ListView.builder(
        itemCount: monographs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(monographs[
                index]), // You should use a more detailed widget here for each monograph.
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navigate to the Add Monograph page to edit the monograph
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMonographPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      monographs.removeAt(
                          index); // Remove the monograph from the list
                    });
                  },
                ),
              ],
            ),
            onTap: () {
              // Navigate to the Monograph Details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MonographDetailsPage(monograph: monographs[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMonographPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
