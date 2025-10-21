import 'package:flutter/material.dart';

Future<void> scrollListener(
    {required ScrollController controller, required Function onEnd}) async {
  if (controller.position.pixels == controller.position.maxScrollExtent) {
    onEnd();
  }
}
