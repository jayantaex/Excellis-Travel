import 'dart:io';
import 'package:flutter/material.dart';

Future<void> showPhotoPreview(
    {required BuildContext context, required String url}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog.adaptive(
      content: SizedBox(
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              Image.file(File(url), height: 200, width: 200, fit: BoxFit.fill),
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Update'))
      ],
    ),
  );
}
