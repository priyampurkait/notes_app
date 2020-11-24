import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/home_page/widgets/home_fab.dart';
import 'package:notes/utils/Util.dart';
import 'package:provider/provider.dart';

import 'package:notes/pages/home_page/widgets/home_body.dart';
import 'package:notes/providers/note_state_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // the GlobalKey is needed to animate the list
  // final GlobalKey<AnimatedListState> _listKey = GlobalKey(); // backing data

  @override
  Widget build(BuildContext context) {
    int count = context.watch<NoteStateProvider>().count;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.5,
        actions: count != 0
            ? <Widget>[
                IconButton(
                    icon: Icon(Icons.delete_outline),
                    tooltip: 'Delete all note!',
                    onPressed: () async {
                      bool deleteNote = await Util.showDialogs(
                          context: context,
                          title: "Delete All Note",
                          description:
                              "Are you sure you want to delete all notes?");
                      print('Dialog: $deleteNote');
                      if (deleteNote) {
                        int result = await context
                            .read<NoteStateProvider>()
                            .deleteAllNote();
                        print('Delete All Note: $result');
                      }
                    })
              ]
            : null,
      ),
      body: HomeBody(count: count),
      floatingActionButton: HomeFab(),
    );
  }
}
