import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/database/database_helper.dart';
import 'package:notes/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteStateProvider with ChangeNotifier, DiagnosticableTreeMixin {
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Note> _noteList = [];
  int _count = 0;
  int _priority = 2;

  NoteStateProvider() {
    updateListView();
  }

  int get priority => _priority;
  int get count => _count;
  Future<List<Note>> get getNoteList => databaseHelper.getNoteList();
  List<Note> get getNoteLists => _noteList;

  void updateListView() async {
    final Future<Database> db = databaseHelper.database;
    db.then((Database database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((List<Note> noteList) {
        _noteList = noteList;
        _count = noteList.length;
        notifyListeners();
      });
    });
  }

  // Save data to database
  Future<bool> saveNote({Note note}) async {
    note.date = "${DateTime.now()}";
    if (note.id != null) {
      // Case 1: Update operation
      await databaseHelper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      await databaseHelper.insertNote(note);
    }
    // _priority = 2;
    updateListView();
    return true;
  }

  // Delete data from database
  Future<int> delete({Note note}) async {
    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await databaseHelper.deleteNote(note.id);
    updateListView();
    print('Delete: $result');
    return result;
  }

  Future<int> deleteAllNote() async {
    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await databaseHelper.deleteAllNote();
    notifyListeners();
    updateListView();
    return result;
  }

  int updatePriorityAsInt(int value) {
    switch (value + 1) {
      case 1:
        {
          _priority = 1;
          notifyListeners();
          return _priority;
        }
      case 2:
        {
          _priority = 2;
          notifyListeners();
          return _priority;
        }
      default:
        return _priority;
    }
  }
}
