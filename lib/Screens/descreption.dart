
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/Screens/model.dart';

class Description extends StatefulWidget {
  final int index;

  const Description({Key? key, required this.index}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  TextEditingController descriptControll = TextEditingController();
  List<MemberList> dataList = [];
  bool _isEditing = false;
  late SharedPreferences sp;
 






  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NotePad"),
          actions: [
            ElevatedButton(
              onPressed: () {
              
                setState(() {
                  _isEditing = false;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 95, 95, 95)),
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 0.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 95, 95, 95)),
                ),
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextField(
                    controller: descriptControll,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText:
                          //  if (loadDescription == ){

                          // }
                          'Type description text here..',
                      contentPadding: EdgeInsets.all(16.0),
                      border: InputBorder.none,
                    ),
                    enabled: _isEditing,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
