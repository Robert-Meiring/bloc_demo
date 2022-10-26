import 'package:flutter/material.dart';
import 'package:test_app/dependency_injection/register_factory.dart';
import 'package:test_app/screens/home_screen.dart';

void main() {
  //Init our Dependency Injection
  RegisterFactory().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
