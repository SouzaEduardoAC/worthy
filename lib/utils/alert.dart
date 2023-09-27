import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(context: context, builder: (context) {
    return WillPopScope(
        child: AlertDialog(
          title: Text('Worthy'),
          content: Text(msg),
          actions: <Widget>[
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        ),
        onWillPop: () async => false);
  });
}

