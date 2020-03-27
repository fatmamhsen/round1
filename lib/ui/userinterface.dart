import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round/bottom_app/base.dart';
import 'dart:ui';
import 'package:round/screens/mosque.dart';
import 'package:round/screens/museum.dart';
import 'package:round/screens/park.dart';
import 'package:round/screens/pyramids.dart';



class Round extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoundState();
}

class _RoundState extends State<Round> {
  final Color primary = Color(0xff696b9e);
  final Color active = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Base(),
      body: Container(
        color: Colors.grey.shade100,
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('images/map.jpg'),
//            fit: BoxFit.cover,
//          ),
//        ),
//        child: BackdropFilter(
//          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/mosque.jpg'),
                      radius: 100.0,
                      child: FlatButton(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),),
                        child: Text(
                          'المساجد',
                          style: TextStyle(
                            fontFamily: 'Lemonada',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mosque()));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/museum.jpg',
                      ),
                      radius: 100.0,
                      child: FlatButton(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),),
                        child: Text(
                          'المتاحف',
                          style: TextStyle(
                            fontFamily: 'Lemonada',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Museum()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/pyramid.jpg'),
                      radius: 100.0,
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 10.0,
                            vertical: 6.0),
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),),
                        child: Text(
                          'المعالم السياحيه',
                          style: TextStyle(
                            fontFamily: 'Lemonada',
                            fontSize: 19.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pyramids()));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/park.jpg'),
                      radius: 100.0,
                      child: FlatButton(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),),
                        child: Text(
                          'الحدائق',
                          style: TextStyle(
                            fontFamily: 'Lemonada',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Park()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}