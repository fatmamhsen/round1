import 'package:flutter/material.dart';
import 'package:round/model/visit.dart';
import 'package:round/ui/visit_info.dart';
import 'package:round/ui/visit_screen.dart';
import 'package:round/utils/database_helper.dart';


class ListViewVisit extends StatefulWidget{
  @override
  _ListViewVisitState createState() => new _ListViewVisitState();
}

class _ListViewVisitState extends State<ListViewVisit> {

  List<Visit> items = new List();
  DatabaseHelper vs = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    vs.getAllVisit().then((visits) {
      setState(() {
        visits.forEach((visit) {
          items.add(Visit.fromMap(visit));
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    //appbar of list
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Visit',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
           icon: Icon(Icons.arrow_back),
            onPressed: (){
             Navigator.pop(context);
            },
          ),
          title: Text('شاركنا خروجتك',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Lemonada',
            fontSize: 18.0,
          ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff696b9e),
        ),

        // build list
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 8.0,),
                    Row(
                      children: <Widget>[
                        new Expanded(
                        //display info
                          child: ListTile(
                              title: Text('${items[position].place}',
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.deepPurple,
                                ),
                              ),
                              subtitle: Text('${items[position].site}',
                                style: TextStyle(
                                  fontSize: 14.0, fontStyle: FontStyle.italic,
                                ),
                              ),
                              leading: Column(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(1.0)),
                                  CircleAvatar(
                                    backgroundColor: Colors.black38,
                                    radius: 18.0,
                                    child: Text('${items[position].id}',
                                      style: TextStyle(
                                          fontSize: 22.0, color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () =>
                                  _navigateToVisitInfo(
                                      context, items[position]),
                            ),
                        ),
// button edit
                        IconButton(icon: Icon(Icons.edit,color: Colors.blueAccent,),
                          onPressed: () => _navigateToVisit(context , items[position]),
                        ),
// button delete
                        IconButton(icon: Icon(Icons.delete,color: Colors.red,),
                            onPressed: () => _deleteVisit(context,items[position],position)
                        )
                      ],
                    ),
                  ],
                );
              }
          ),
        ),

        //button add
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xff696b9e),
            onPressed: () => _createNewVisit(context)),
      ),
    );
  }

// method delete
  _deleteVisit(BuildContext context,Visit visit,int position) async{
    vs.deleteVisit(visit.id).then((visits){
      setState(() {
        items.removeAt(position);
      });
    });
  }

//method display list
  void _navigateToVisit(BuildContext context, Visit visit) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VisitScreen(visit)),
    );
// edit list
    if (result == 'update') {
      vs.getAllVisit().then((visits) {
        setState(() {
          items.clear();
          visits.forEach((visit) {
            items.add(Visit.fromMap(visit));
          });
        });
      });
    }
  }
    void _navigateToVisitInfo(BuildContext context, Visit visit) async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VisitInfo(visit)),
      );
    }

//method new card in list
    void _createNewVisit(BuildContext context) async {
      String result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            VisitScreen(
                Visit('', '', '', ''))),
      );
//save list
      if (result == 'save') {
        vs.getAllVisit().then((visits) {
          setState(() {
            items.clear();
            visits.forEach((visit) {
              items.add(Visit.fromMap(visit));
            });
          });
        });
      }
    }
  }

