import 'package:flutter/material.dart';

class Util {
  static Future<bool> showDialogs(
      {BuildContext context, String title, String description}) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
                // Text('It will be deleted permanently.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }
}
