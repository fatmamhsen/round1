import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round/model/visit.dart';
import 'package:round/utils/database_helper.dart';


class VisitInfo extends StatefulWidget{
  final Visit visit;
  VisitInfo(this.visit);
  @override
  _VisitInfoState createState() => new _VisitInfoState();

}

class _VisitInfoState extends State<VisitInfo> {
//object from dataHelper

  DatabaseHelper vs = new DatabaseHelper();
// info to use
  String place = '';
  String site = '';
  String date = '';
  String ticket = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    place = widget.visit.place;
    site = widget.visit.site;
    date = widget.visit.date;
    ticket = widget.visit.ticket;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المعلومات',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Lemonada',
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff696b9e),
      ),
      //enter your info
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
             alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 40.0)),
                Card(
                  color: Colors.grey.shade300,
                  child: Text(' المكان : $place ',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0)),
                Card(
                  color: Colors.grey.shade300,
                  child: Text(' الموقع : $site ',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0)),
                Card(
                  color: Colors.grey.shade300,
                  child: Text(' المواعيد : $date ',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0 )),
                Card(
                    color: Colors.grey.shade300,
                    child: Text(' التذكرة : $ticket ',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 22.0,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}