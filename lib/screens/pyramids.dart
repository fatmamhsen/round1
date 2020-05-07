import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round/data/pyramidsdata.dart';

class Pyramids extends StatefulWidget {
  Pyramids({Key key}) : super(key: key);
  _PyramidsState createState() => _PyramidsState();
}

class _PyramidsState extends State<Pyramids> {
  PyramidsData info = new PyramidsData();
  final primary = Color(0xff0b83a8);
  final secondary = Color(0xff0b83a8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: info.pyramids.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                      Text(
                        "المعالم السياحية",
                        style: TextStyle(
                          fontFamily: 'Lemonada',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.place),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    void _showSecondPage(BuildContext context){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Scaffold(
            body: Center(
              child: Hero(
                tag: '${info.pyramids[index]['tag']}',
                child: Image.asset('${info.pyramids[index]['logotext']}'),
              ),
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 195,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(width: 3 ,color: secondary)
              ),
              child: GestureDetector(
                child: Hero(
                  tag: '${info.pyramids[index]['tag']}',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('${info.pyramids[index]['logotext']}'),
                  ),
                ),
                onTap: () => _showSecondPage(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    info.pyramids[index]['name'],
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        info.pyramids[index]['location'],
                        style: TextStyle(
                          color: primary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.location_on,
                        color: secondary,
                        size: 19,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        info.pyramids[index]['date'],
                        style: TextStyle(
                          color: primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.access_time,
                        color: secondary,
                        size: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        info.pyramids[index]['cafe'],
                        style: TextStyle(
                          color: primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.fastfood,
                        color: secondary,
                        size: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        info.pyramids[index]['price'],
                        style: TextStyle(
                          color: primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.monetization_on,
                        color: secondary,
                        size: 18,
                      ),
                    ],
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
