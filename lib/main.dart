import 'package:flutter/material.dart';
import 'package:tchat/screens/screens.dart';
import 'package:tchat/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.dark, 
      // darkTheme: AppTheme.dark,
      // themeMode: ThemeMode.light,
      title:'Tchat' ,
      home: HomeScreen(),
      
    );
  }
}