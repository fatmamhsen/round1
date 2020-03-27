import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:round/model/visit.dart';

//database table contain column and row
class DatabaseHelper{
  final String tableVisit = 'visitTable';
  final String columnId = 'id';
  final String columnPlace = 'المكان';
  final String columnSite = 'الموقع';
  final String columnDate = 'المواعيد';
  final String columnTicket = 'التذكرة';


  static Database _vs ;

  Future<Database> get vs async{
    if(_vs != null){
      return _vs ;
    }
    _vs = await initVs();

    return _vs;
  }
//version of database
  initVs() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , 'visits.db');
    var vs = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return vs;
  }

//syntax to write table
  void _onCreate(Database vs , int newVersion) async{
    var sql = 'CREATE TABLE $tableVisit ($columnId INTEGER PRIMARY KEY,'
        '$columnPlace TEXT ,$columnSite TEXT ,'
        '$columnDate TEXT ,$columnTicket TEXT )';
    await vs.execute(sql);
  }

// save

  Future<int> saveVisit(Visit visit) async{
    var vsClient = await vs;
    var result = await vsClient.insert(  tableVisit , visit.toMap() );
    return result;
  }

//get all data
  Future<List> getAllVisit() async{
    var vsClient = await vs;
    var result = await vsClient.query(
        tableVisit ,
        columns: [columnId,columnPlace,
          columnSite,columnDate,
          columnTicket]
    );
    return result.toList();
  }

// get count data
  Future<int> getCount() async{
    var vsClient = await vs;

    return Sqflite.firstIntValue(await vsClient.rawQuery('SELECT COUNT(*) FROM $tableVisit'));
  }

// get one data
  Future<Visit> getVisit(int id) async{
    var vsClient = await vs;
    List<Map> result = await vsClient.query(
        tableVisit ,
        columns: [columnId,columnPlace,
          columnSite,columnDate,
          columnTicket],where: '$columnId = ?',whereArgs: ['id']
    );

    if(result.length > 0){
      return new Visit.fromMap(result.first);
    }

    return null;
  }
// update and edit
  Future<int> updateVisit(Visit visit)  async{
    var vsClient = await vs;
    return await vsClient.update(
        tableVisit , visit.toMap(), where: '$columnId = ?',whereArgs: [ visit.id ]
    );
  }

//delete
  Future<int> deleteVisit(int id) async{
    var vsClient = await vs;
    return await vsClient.delete(
        tableVisit,   where: '$columnId = ?',whereArgs: [id]
    );
  }

// close database
  Future  close() async{
    var vsClient = await vs;
    return await vsClient.close();
  }


}