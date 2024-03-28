import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/Screens/descreption.dart';
import 'package:todo_app2/Screens/drawer.dart';
import 'package:todo_app2/Screens/model.dart';
import 'package:todo_app2/Screens/widgit/dailogBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController addControll = TextEditingController();
  TextEditingController upDateControll = TextEditingController();
  List<MemberList> dataList = [];

  late SharedPreferences sp;

  getSharedPreference() async {
    sp = await SharedPreferences.getInstance();
    await addMember(addControll.text);
  }

  saveData() {
    List<String> MemberListString =
        dataList.map((dataList) => jsonEncode(dataList.toJson())).toList();
    sp.setStringList('myData', MemberListString);
    print('Data saved to SharedPreferences  $MemberListString');
    setState(() {});
  }

  addMember(String title) async {
    setState(() {
      dataList.add(MemberList(title: addControll.text));
    });
    await saveData();
  }

  deleteItem(item) {
    setState(() {
      dataList.removeAt(item);
      saveData();
    });
  }

  updateItem(int item, String updatedTitle) {
    setState(() {
      dataList[item].title = updatedTitle;
      saveData();
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow.shade500,
        title: Text(
          "myLabel",
          style: GoogleFonts.oregano(
            textStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
      backgroundColor: Colors.yellow.shade500,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showPopup(
            context,
            addMember,
            addControll,
          );
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 239, 3, 3),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 5.0,
                  right: 5.0,
                ),
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(1.0, 3.0, 0.0, 3.0),
                      child: ListTile(
                        tileColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        leading: CircleAvatar(
                          child: Text(
                            dataList.isNotEmpty &&
                                    dataList[index].title != null &&
                                    dataList[index].title!.length >= 2
                                ? dataList[index]
                                    .title!
                                    .substring(0, 2)
                                    .toUpperCase()
                                : 'No',
                            style: const TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(index: index),
                            ),
                          );
                        },
                        title: Text(
                          dataList[index].title ?? 'No data',
                          style: GoogleFonts.inder(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(182, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                upDateControll.text =
                                    dataList[index].title ?? '';
                                editePopup(
                                  context,
                                  index,
                                  upDateControll,
                                  updateItem,
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(182, 0, 0, 0),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteItem(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(182, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
