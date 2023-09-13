import 'package:eventdata/event_data.dart';
import 'package:flutter/material.dart';
import 'event_data.dart';
import 'manager.dart';

Future<void> main() async{
   await setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: EventsDate());
  }
}
