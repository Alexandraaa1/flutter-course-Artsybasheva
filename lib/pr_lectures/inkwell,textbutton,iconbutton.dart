import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
                children: [
                  Text(
                    'IconButton:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  iconButton(),
                  const SizedBox(height: 4),
                  Divider(),
                  const SizedBox(height: 4),
                  Text(
                    'TextButton:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  textButton(),
                  const SizedBox(height: 4),
                  Divider(),
                  const SizedBox(height: 4),
                  Text(
                    'InkWell:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  inkWell(),
                  const SizedBox(height: 4),
                  Divider(),
                  const SizedBox(height: 4),
                ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconButton() {
    return IconButton(
      onPressed: () {
        print('нажато');
      },
      icon: Icon(Icons.delete),
      color: Colors.red,
    );
  }

  Widget textButton() {
    return TextButton(
      onPressed: () {
        print('нажато');
      },
      child: Text(
        'Текстовая кнопка',
        style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget inkWell() {
    return InkWell(
      onTap: () {
        print('нажали');
      },
      child: Text('InkWell кнопка', style: TextStyle(fontWeight: FontWeight.w800),),
    );
  }
}