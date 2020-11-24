import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:notes/pages/home_page/home_page.dart';
import 'package:notes/providers/note_state_provider.dart';
import 'app_theme/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteStateProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      home: HomePage(title: 'Notes'),
    );
  }
}

// theme: ThemeData(
//         primarySwatch: Colors.green,
//         primaryColor: Colors.white,
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.green,
//         ),
//         // scaffoldBackgroundColor: Color(0xFFf2f2f2),
//         // appBarTheme: appBarTheme(),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),

// ====================================== //

// darkTheme: ThemeData(
//   brightness: Brightness.dark,
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     foregroundColor: Colors.black87,
//     backgroundColor: Colors.green[100],
//   ),
// ),
