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
//object from datahelper

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
        backgroundColor: Color(0xff696b9e),
      ),
      //enter your info
      body: Container(
        margin: EdgeInsets.all(15.0),
         alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Card(
              color: Colors.grey.shade300,
              child: Text(' المكان : $place ',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Card(
              color: Colors.grey.shade300,
              child: Text(' الموقع : $site ',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Card(
              color: Colors.grey.shade300,
              child: Text(' المواعيد : $date ',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Card(
              color: Colors.grey.shade300,
              child: Text(' التذكرة : $ticket ',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}