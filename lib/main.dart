import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //adding stream controller
  StreamController<double> controller = StreamController();
  StreamSubscription<double>streamSubscription;
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
            mainAxisSize: MainAxisSize.min,
            children:[ MaterialButton(
              child: Text(
                "touch"
              ),
              color: Colors.brown,
              onPressed: () {

                //added stream listener....
                Stream stream = controller.stream;
               streamSubscription = stream.listen((event) {
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

              //managing your streams to avoid memory leaks
              MaterialButton(
                color: Colors.red,
                  child: Text(
                    "UnSubscribe"
                  ),
                  onPressed: (){
                  streamSubscription.cancel();

                  })
         ] ),

        ),
      )
    );
  }
}
