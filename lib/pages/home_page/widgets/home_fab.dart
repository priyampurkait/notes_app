import 'package:flutter/material.dart';

import 'package:notes/models/note_model.dart';
import 'package:notes/pages/details_page/details_page.dart';
import 'package:animations/animations.dart';

class HomeFab extends StatelessWidget {
  const HomeFab({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Brightness brightness = MediaQuery.of(context).platformBrightness;
    return OpenContainer(
        // transitionDuration: Duration(milliseconds: 420),
        closedColor: Colors.transparent,
        closedShape: CircleBorder(),
        closedElevation: 0.0,
        openElevation: 0.0,
        closedBuilder: (context, openWidget) => FloatingActionButton(
              elevation: 0.0,
              onPressed: openWidget,
              tooltip: 'Add New Note',
              child: Icon(Icons.add),
            ),
        openBuilder: (context, closeWidget) => DetailsPage(
              title: "Add Note",
              note: Note(title: "", date: "${DateTime.now()}", priority: 2),
            ));
  }
}
