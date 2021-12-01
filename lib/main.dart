import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //adding stream controller
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController<double>.broadcast();

  StreamSubscription<double> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              MaterialButton(
                child: Text("subscribe"),
                color: Colors.brown,
                onPressed: () {

                  getRandom().listen((event) {
                    print("here is the value: $event");
                  });
                  /*
                //added stream listener....
                Stream stream = controller.stream;
               streamSubscription = stream.listen((event) {
                  print("subscribe value: $event");

                });
*/
                },
              ),

              MaterialButton(
                  child: Text("show print-log"),
                  color: Colors.blue,
                  onPressed: () {
                    //add value to stream
                    controller.add(13);
                  }),

              //managing your streams to avoid memory leaks
              MaterialButton(
                  color: Colors.red,
                  child: Text("UnSubscribe"),
                  onPressed: () {
                    streamSubscription.cancel();
                  })
            ]),
          ),
        ));
  }
}

Stream<double> getRandom() async* {
  var random = Random();

  while (true) {
    await Future.delayed(Duration(seconds: 2));
    yield random.nextDouble();
  }
}
