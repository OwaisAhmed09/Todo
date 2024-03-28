import 'package:flutter/material.dart';


void showPopup(
  BuildContext context,
  Function(String) addMember,
  TextEditingController aDDControll,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Add"),
        content: TextField(
          decoration: const InputDecoration(hintText: "Add Your Content"),
          controller: aDDControll,
        ),
        actions: [
          TextButton(
            onPressed: () {
              addMember(aDDControll.text);
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  ).then((value) => aDDControll.clear());
}





void editePopup(
  BuildContext context,
  int index,
  TextEditingController upDateControll,
  Function(int, String) tapCall,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Edit"),
        content: TextField(
          decoration: const InputDecoration(hintText: "Edit Your Content"),
          controller: upDateControll,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              tapCall(index, upDateControll.text);
              Navigator.of(context).pop();
            },
            child: const Text("Update"),
          ),
        ],
      );
    },
  ).then((value) => upDateControll.clear());
}

