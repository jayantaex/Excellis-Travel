import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required String message,
    required String title,
    required VoidCallback onOk}) {
  // set up the buttons
  Widget okButton = TextButton(
    onPressed: onOk,
    child: const Text("OK"),
  );
  //cancel button

  Widget cancelButton = TextButton(
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
    child: const Text(
      "Cancel",
      style: TextStyle(color: Colors.red),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog.adaptive(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
