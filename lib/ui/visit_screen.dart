import 'package:flutter/material.dart';
import 'package:round/model/visit.dart';
import 'package:round/utils/database_helper.dart';

class VisitScreen extends StatefulWidget{
  final Visit visit;
  VisitScreen(this.visit);
  @override
  _VisitScreenState createState() => new _VisitScreenState();

}

class _VisitScreenState extends State<VisitScreen> {

  DatabaseHelper vs = new DatabaseHelper();
// textController of textFiled

  TextEditingController _placeController;
  TextEditingController _siteController;
  TextEditingController _dateController;
  TextEditingController _ticketController;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    _placeController = new TextEditingController(text: widget.visit.place);
    _siteController = new TextEditingController(text: widget.visit.site);
    _dateController = new TextEditingController(text: widget.visit.date);
    _ticketController = new TextEditingController(text: widget.visit.ticket);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('خروجتك',
          style: TextStyle(
            fontFamily: 'Harmattan',
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ) ,
      centerTitle: true,
      backgroundColor: Color(0xff696b9e),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _placeController,
              decoration: InputDecoration(labelText: 'المكان'),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _siteController,
              decoration: InputDecoration(labelText: 'الموقع'),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'المواعيد'),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _ticketController,
              decoration: InputDecoration(labelText: 'التذكرة'),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
//edit or save
            RaisedButton(
              child: (widget.visit.id != null) ? Text(
                'update',style: TextStyle(color: Colors.white),) : Text('save',style: TextStyle(color: Colors.white),) ,
              color: Colors.green.shade800,
              onPressed: () {
                if(widget.visit.id != null){
                  vs.updateVisit(Visit.fromMap({
                    'id' : widget.visit.id,
                    'المكان' : _placeController.text,
                    'الموقع' : _siteController.text,
                    'المواعيد' : _dateController.text,
                    'التذكرة' : _ticketController.text,
                  })).then((_){
                    Navigator.pop(context, 'update');
                  }) ;
                } else {
                  vs.saveVisit(Visit(
                      _placeController.text,
                      _siteController.text,
                      _dateController.text,
                      _ticketController.text,

                  )).then((_){
                    Navigator.pop(context, 'save');
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}