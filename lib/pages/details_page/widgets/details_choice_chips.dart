import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/models/note_model.dart';
import 'package:notes/providers/note_state_provider.dart';

class ChoiceChips extends StatelessWidget {
  const ChoiceChips({
    Key key,
    @required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        2,
        (int index) {
          int priority = context.watch<NoteStateProvider>().priority;
          return ChoiceChip(
            backgroundColor: Colors.grey[400],
            selectedColor: note.priority == 1
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            label: Text(
              "Priority ${index + 1 == 1 ? 'High' : 'Low'}",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.black87),
            ),
            selected: note.priority == index + 1,
            onSelected: (bool selected) {
              print('onSelected: $selected');
              print('state priority: $priority');
              print('index: $index');
              int result =
                  context.read<NoteStateProvider>().updatePriorityAsInt(index);
              note.priority = result;
              print(note.priority);
            },
          );
        },
      ).toList(),
      alignment: WrapAlignment.spaceEvenly,
    );
  }
}
