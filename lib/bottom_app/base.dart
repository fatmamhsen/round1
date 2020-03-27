import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round/ui/listview_visit.dart';
import 'about.dart';
import 'home.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {

  int currentTab = 0;
  final List<Widget> screens = [
    About(),
    Home(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff696b9e),
        child: Icon(Icons.add),
          onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListViewVisit() ),);
          }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //shape of button home
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home();
                        currentTab = 0;
                      });
                    },
                    padding: EdgeInsets.only(left: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          size: 38,
                          color: currentTab == 0 ? Color(0xff696b9e) : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                children: <Widget>[
                  //shape button about
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            About();
                        currentTab = 1;
                      });
                    },
                    padding: EdgeInsets.only(right: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          size: 35,
                          color: currentTab == 1 ? Color(0xff696b9e) : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}