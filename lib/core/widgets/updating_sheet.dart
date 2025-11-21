import 'package:flutter/material.dart';

Future<void> showUpdatingSheet({required BuildContext context}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        children: [
          Text(
            "Update Available",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: 45,
            width: 45,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    ),
  );
}
