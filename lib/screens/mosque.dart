import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round/data/mosquedata.dart';

class Mosque extends StatefulWidget {
  Mosque({Key key}) : super(key: key);
  _MosqueState createState() => _MosqueState();
}

class _MosqueState extends State<Mosque> {
  MosqueData info = new MosqueData();
  final primary = Colors.blueGrey;
  final secondary = Colors.blueGrey;

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
                // build list

                child: ListView.builder(
                    itemCount: info.mosque.length,
                    itemBuilder: (BuildContext context, int index) {
                     return buildList(context, index);
                    }),
              ),
              // add main container of name and Icon

               Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),),
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
                        "المساجد",
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
// build list of hero to open photo

  Widget buildList(BuildContext context, int index) {
      void _showSecondPage(BuildContext context){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => Scaffold(
              body: Center(
                  child: Hero(
                    tag: '${info.mosque[index]['tag']}',
                    child: Image.asset('${info.mosque[index]['logotext']}'),
                  ),
                ),
              ),
            ),
        );
    }
    // container of info

    return Container(
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
          // of photo
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(width: 3 ,color: secondary)
            ),
            child: GestureDetector(
              child: Hero(
                  tag: '${info.mosque[index]['tag']}',
                  child: CircleAvatar(
                      backgroundImage: AssetImage('${info.mosque[index]['logotext']}'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  info.mosque[index]['name'],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      info.mosque[index]['location'],
                      style: TextStyle(
                        color: primary,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: secondary,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      info.mosque[index]['date'],
                      style: TextStyle(
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.fastfood,
                      color: secondary,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      info.mosque[index]['cafe'],
                      style: TextStyle(
                        color: primary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: secondary,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      info.mosque[index]['price'],
                      style: TextStyle(
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
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
