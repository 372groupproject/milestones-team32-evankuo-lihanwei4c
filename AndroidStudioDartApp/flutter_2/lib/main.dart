import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp2());
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff009688),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('images/icons8-confectionery-64.png'),
                radius: 75,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Delicious Ice Cream',
                textScaleFactor: 2.0,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontFamily: 'Rubik',
                ),
              ),
              FlatButton(
                onPressed: () {
                  print("Got here3");
                },
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.ac_unit,
                          color: Colors.teal,
                          size: 30,
                        ),
                        Container(
                          child: Opacity(opacity: 0.0),
                          width: 20,
                        ),
                        Text(
                          "Find Our Shop",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.teal,
                            fontFamily: 'Rubik',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
