import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// this String is the default String that will be shown before get the http.get request
  String data = 'waiting';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('try from laptop 2'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // this textbutton function is to change data string from waiting to http.get response
              TextButton(onPressed: () {
                getHello();
              }, child: const Text('press')),
              const SizedBox(height: 10,),
              Text(data),
            ],
          ),
        ),
      ),
    );
  }
  // below is the function of http get request
  getHello () async
  {
    final response = await http.get(
    // be attention i used this ip because the server and the andriod studio
    // framework was not at the same machine
        Uri.parse('http://192.168.43.72:3000/')
    );

    setState(() {
      data = response.body;
    });
  }
}