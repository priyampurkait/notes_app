import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/utils/Util.dart';
import 'package:provider/provider.dart';

import 'package:notes/models/note_model.dart';
import 'package:notes/providers/note_state_provider.dart';
import 'widgets/details_choice_chips.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key key, this.title, this.note}) : super(key: key);
  final String title;
  final Note note;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.description;

    print('state note: ${note.priority}');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        actions: note.id != null
            ? <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () async {
                      bool deleteNote = await Util.showDialogs(
                          context: context,
                          title: "Delete Note",
                          description:
                              "Are you sure you want to delete this note?");
                      print('Dialog: $deleteNote');
                      if (deleteNote) {
                        int result = await context
                            .read<NoteStateProvider>()
                            .delete(note: note);
                        if (result == 1) {
                          moveToLastScreen(context: context, state: 'delete');
                        }
                      }
                    })
              ]
            : null,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 64),
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            // First element
            // choiceChips(),
            ChoiceChips(note: note),
            // Second Element
            Text(
              "${DateFormat.yMMMd().format(DateTime.parse(note.date))} | "
              "${DateFormat.jm().format(DateTime.parse(note.date)).toLowerCase()}",
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 10),
              textAlign: TextAlign.center,
            ),
            // Third Element
            TextField(
              controller: titleController,
              // autofocus: true,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              onChanged: (value) {
                // debugPrint('Something changed in Title Text Field');
                updateTitle();
              },
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),

            // Fourth Element
            TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              minLines: 20,
              onChanged: (value) {
                // debugPrint('Something changed in Description Text Field');
                updateDescription();
              },
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                hintText: 'Description',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          debugPrint("saveNote");
          FocusManager.instance.primaryFocus.unfocus();
          if (note.id == null && titleController.text.isEmpty) {
            debugPrint("true");
            note.title = "Untitled";
          }
          bool isNoteSaved =
              await context.read<NoteStateProvider>().saveNote(note: note);
          if (isNoteSaved) {
            Navigator.pop(context);
          }
        },
        label: Text('Save Note'),
        icon: Icon(Icons.note_add),
      ),
    );
  }

  void moveToLastScreen({BuildContext context, String state}) {
    Navigator.pop(context, state);
  }

  // Update the title of Note object
  void updateTitle() {
    note.title = titleController.text;
  }

  // Update the description of Note object
  void updateDescription() {
    note.description = descriptionController.text;
  }

  // static Future<bool> showDialogs(
  //     {BuildContext context, String title, String description}) async {
  //   return showDialog<bool>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //         title: Text(title),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(description),
  //               // Text('It will be deleted permanently.'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text(
  //               'Cancel',
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .button
  //                   .copyWith(color: Colors.grey),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop(false);
  //             },
  //           ),
  //           TextButton(
  //             child: Text(
  //               'Delete',
  //               style: TextStyle(
  //                 color: Theme.of(context).iconTheme.color,
  //               ),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop(true);
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }
}
