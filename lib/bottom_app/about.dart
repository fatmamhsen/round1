import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff696b9e),
        title: Text(
          'حول',
          style: TextStyle(
            fontFamily: 'Harmattan',
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          margin: EdgeInsets.all(10.0),
          child: Text(
            'خدلك راوند'
            ' الأبليكشن بيعرفك الأماكن السياحيه والحدائق اللي موجودة فى معظم أماكن مصر'
            ' سهل جدا تروح لأن موجود جمب كل مكان عنوانه'
            ' عشان ماتتوهش وصورة عن المكان عشان تتعرف عليه بسهولة'
            ' وسعر التيكت ولو حبيت تفصل ف احنا ضفنالك اماكن الكافيهات والمطاعم اللي جمب المكان '
            'وتقدر تضيف الاماكن اللي خرجت فيها عشان لو بتنسي الطريق والخروجه بتكلفك كام !',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Harmattan',
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
