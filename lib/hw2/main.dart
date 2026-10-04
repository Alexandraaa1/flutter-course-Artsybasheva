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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Каталог планет',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '8 объектов в каталоге',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        body: Container(
          color: Color(0xFFE8EEF7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    planetCard1(),
                    planetCard2(),
                    planetCard3(),
                    planetCard4(),
                    planetCard5(),
                    planetCard6(),
                    planetCard7(),
                    planetCard8(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget planetCard1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF6E6E6E),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'Ме',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Меркурий',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1-я планета · +167°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Планета', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFE8A33D),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'В',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.grey, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Венера',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '2-я планета · +464°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Планета', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard3() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF1E88E5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'З',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Земля',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '3-я планета · +15°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Планета', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard4() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFC1440E),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'Ма',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.grey, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Марс',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '4-я планета · −63°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Планета', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard5() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFB07D4C),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'Ю',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.grey, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Юпитер',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '5-я планета · −108°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Газовый гигант', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard6() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFD4A857),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'С',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.grey, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Сатурн',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '6-я планета · −139°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Газовый гигант', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard7() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF7FCDD6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'У',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.grey, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Уран',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '7-я планета · −195°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Ледяной гигант', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planetCard8() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF3559B5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 88,
                height: 120,
                child: Center(
                  child: Text(
                    'Н',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Нептун',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '8-я планета · −201°C',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Ледяной гигант', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1E3A5F))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}