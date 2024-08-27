import 'dart:developer';

import 'package:flutter/material.dart';

void confirmBack(
  BuildContext context,
  String cameFrom,
  bool didPop,
  dynamic result,
) async {
  log("Handling  pop - $cameFrom - $didPop - $result");

  if (didPop) return;

  bool? confirm = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Quit'),
      content: const Text('Are you sure go back?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('No'),
        ),
      ],
    ),
  );

  if (confirm == true) {
    Navigator.pop(context);
  }
}
