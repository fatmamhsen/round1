// define info do you need

class Visit{

  int _id;
  String _place;
  String _site;
  String _date;
  String _ticket;

  Visit(
      this._place , this._site,
      this._date,this._ticket
      );

  Visit.map(dynamic obj){
    this._id = obj['id'];
    this._place = obj['المكان'];
    this._site = obj['الموقع'];
    this._date = obj['المواعيد'];
    this._ticket = obj['التذكرة'];
  }

  int get id => _id;
  String get place => _place;
  String get site => _site;
  String get date => _date;
  String get ticket => _ticket;


  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_id != null){
      map['id'] = _id;
    }

    map['المكان'] = _place;
    map['الموقع'] = _site;
    map['المواعيد'] = _date;
    map['التذكرة'] = _ticket;


    return map;
  }

  Visit.fromMap(Map<String , dynamic> map){

    this._id = map['id'] ;
    this._place = map['المكان'] ;
    this._site = map['الموقع']  ;
    this._date  = map['المواعيد']   ;
    this._ticket = map['التذكرة'] ;



  }


}