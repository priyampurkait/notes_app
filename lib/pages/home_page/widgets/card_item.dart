import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notes/models/note_model.dart';
import 'package:notes/pages/details_page/details_page.dart';
import 'package:notes/utils/navigation_route.dart';

class CardItem extends StatelessWidget {
  final List<Note> data;
  final int index;

  const CardItem({
    Key key,
    @required this.data,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0, top: index < 1 ? 12.0 : 0),
      elevation: 0.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: data[index].priority == 1
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondaryVariant,
          child: data[index].priority == 1
              ? Icon(
                  Icons.arrow_upward,
                  color: Colors.grey[100],
                )
              : Icon(
                  Icons.arrow_upward,
                  color: Theme.of(context).colorScheme.primary,
                ),
        ),
        title: Text(
          data[index].title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
            "${DateFormat.yMMMd().format(DateTime.parse(data[index].date))} | "
            "${DateFormat.jm().format(DateTime.parse(data[index].date)).toLowerCase()}"),
        onTap: () async {
          print("ListTile onTap $index");
          String responce = await Navigator.push(
              context,
              NavigationRoute(
                  builder: (context) => DetailsPage(
                        title: "Edit Note",
                        note: data[index],
                      )));
          print(responce);
        },
      ),
    );
  }
}
