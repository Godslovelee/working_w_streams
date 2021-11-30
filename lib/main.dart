import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //adding stream controller
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
          child: Row(
            children:[ MaterialButton(
              child: Text(
                "touch"
              ),
              color: Colors.brown,
              onPressed: () {

                //added stream listener....
                Stream stream = controller.stream;
                stream.listen((event) {
                  print("subscribe: $event");

                });

            },

            ),

              MaterialButton(
                  child: Text(
                    "show print-log"
                  ),
                  color: Colors.blue,
                  onPressed: (){

                    //add value to stream
                    controller.add(13);

                  }),

              MaterialButton(
                  child: Text(
                    "UnSubscribe"
                  ),
                  onPressed: (){

                  })
         ] ),

        ),
      )
    );
  }
}
