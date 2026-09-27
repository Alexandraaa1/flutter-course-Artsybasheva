import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: SafeArea (child: Center(
                                           child: Column(
                                            children: [
                                              Text('IconButton:', 
                                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                            const SizedBox(height: 4),
                                            
                                            
                                            ],

                                           )
                                                   
                                                    )
                                                    )
                                                    ) 
    );                             
  }
}
