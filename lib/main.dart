import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  StreamController<double> controller = StreamController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            color: Colors.brown,
            onPressed: () {
              Stream stream = controller.stream;

          },

          ),
        ),
      )
    );
  }
}
