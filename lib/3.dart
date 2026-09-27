import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center (child: Container(
                                                    padding:EdgeInsets.all(10), 
                                                    margin: EdgeInsets.all(30),
                                                    alignment: Alignment.centerRight, 
                                                    width:300, height: 1000,
                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 248, 12, 12), border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 5), 
                                                    ),
                                                    child: Icon(Icons.lock)))),
                                   );
  }
}
