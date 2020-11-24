import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/models/note_model.dart';
import 'package:notes/pages/home_page/widgets/card_item.dart';
import 'package:notes/providers/note_state_provider.dart';

class HomeBody extends StatelessWidget {
  final int count;

  const HomeBody({
    Key key,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<NoteStateProvider>().getNoteList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Note> data = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text("Fetching Data"),
            );
          case ConnectionState.active:
            return null;
          case ConnectionState.waiting:
            return Center(
                child: CupertinoActivityIndicator(
              radius: 20.0,
            ));
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }
            return count != 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ListView.builder(
                      // key: _listKey,
                      physics: BouncingScrollPhysics(),
                      itemCount: count,
                      itemBuilder: (BuildContext context, int index) {
                        return CardItem(data: data, index: index);
                      },
                      // itemCount: count,
                    ),
                  )
                : Center(
                    child: Icon(
                      Icons.note_add,
                      size: 128.0,
                      color: Colors.grey[400],
                    ),
                  );

          default:
            return null;
        }
      },
    );
  }
}
