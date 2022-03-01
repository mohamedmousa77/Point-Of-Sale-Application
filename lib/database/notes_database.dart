// import '../models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'note.dart';

class NotesDataBase {
  static final NotesDataBase instance = NotesDataBase._init();
  static Database? _database;
  NotesDataBase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db'); //notesDB where db is stored
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    // final path = join(dbPath, filePath);
    final String path = dbPath + '/' + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // For Create Table
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final TextType = 'TEXT';
    await db.execute('''
      CREATE TABLE $tableNotes(
      ${NotesField.id} $idType,
      ${NotesField.title} $TextType,
      ${NotesField.date} $TextType
      );
      ''');
    await db.execute('''
      CREATE TABLE $tableTodayvists(
      ${VisitFields.id} $idType,
      ${VisitFields.title} $TextType
      );
        ''');
    await db.execute('''
      CREATE TABLE $tableTodayVists(
      ${TodayVisitFields.id} $idType,
      ${TodayVisitFields.title} $TextType,
      ${TodayVisitFields.today_id} $TextType,
      FOREIGN KEY (${TodayVisitFields.today_id}) REFERENCES $tableNotes (${NotesField.id})
     
      );
        ''');
    //      CAR
    await db.execute('''
      CREATE TABLE $tableCarProducts(
      ${CarProductField.id} $idType,
      ${CarProductField.title} $TextType,
      ${CarProductField.count} $TextType,
      ${CarProductField.price} $TextType,
      ${CarProductField.ImageUrl} $TextType
      );
        ''');
  }

  ////////////////// Visit //////////////////////
  // Insert Into Visits Table
  Future<TodatVisit> createnewVisit(TodatVisit newvisit) async {
    final db = await instance.database;
    final id = await db.insert(tableTodayVists,
        // note.toJson()
        {
          TodayVisitFields.title: newvisit.title,
          TodayVisitFields.today_id: newvisit.today_id
        });
    return newvisit.CopyVisit(id: id);
  }

  // Read From Visits table
  Future<List<TodatVisit>> readAllnewvisits() async {
    final db = await instance.database;
    // final orderby = '${NotesField.date} ASC';
    final result = await db.query(tableTodayVists);
    return result.map((json) => TodatVisit.fromJsonvisit(json)).toList();
  }

  // Update Visit
  Future<int> updateVsist(TodatVisit visit) async {
    final db = await instance.database;
    db.update(
      tableTodayVists,
      visit.toJsonvisit(),
      where: '${TodayVisitFields.id}= ?',
      whereArgs: [visit.id],
    );
    return 1;
  }

  // Delete Visit
  Future<int> deleteVisit(int id) async {
    final db = await instance.database;
    return db.delete(tableTodayVists,
        where: '${TodayVisitFields.id}= ?', whereArgs: [id]);
  }

  ////////////////// Cart //////////////////////
  // Insert in Car table
  Future<Car> createCar(Car car) async {
    final db = await instance.database;
    final id = await db.insert(tableCarProducts,
        // note.toJson()
        {
          CarProductField.title: car.title,
          CarProductField.price: car.price,
          CarProductField.count: car.count,
          CarProductField.ImageUrl: car.ImageUrl
        });
    return car.copyCar(id: id);
  }

  // Update Cat
  Future<int> updateCar(Car car) async {
    final db = await instance.database;
    db.update(
      tableCarProducts,
      car.toJsonCar(),
      where: '${CarProductField.id}= ?',
      whereArgs: [car.id],
    );
    return 4;
  }

  Future<bool> clearCar() async {
    final db = await instance.database;
    db.delete(
      tableCarProducts,
    );
    return true;
  }

  // Delete Car
  Future<int> deleteCar(int id) async {
    final db = await instance.database;
    return db.delete(tableCarProducts,
        where: '${CarProductField.id}= ?', whereArgs: [id]);
  }

  /////////////////// Visits /////////////////////////
  // Read From Car Table
  Future<List<Car>> readAllCarProducts() async {
    final db = await instance.database;
    // final orderby = '${NotesField.date} ASC';
    final result = await db.query(tableCarProducts);
    return result.map((json) => Car.fromJsonCar(json)).toList();
  }

  // Insert Into Visits Table
  Future<Visit> createinVisit(Visit visit) async {
    final db = await instance.database;
    final id = await db.insert(tableTodayvists,
        // note.toJson()
        {
          VisitFields.title: 'Super Market',
        });
    return visit.copyvisit(id: id);
  }

  // Read From Visits table
  Future<List<Visit>> readAllvisits() async {
    final db = await instance.database;
    final result = await db.query(tableTodayvists);
    return result.map((json) => Visit.fromJsonVisit(json)).toList();
  }

  /////////////////// Note ///////////////////
  // Insert Into Notes Tableblue
  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes,
        // note.toJson()
        {
          NotesField.title: note.title,
          NotesField.date: note.createdDate.toIso8601String(),
        });
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;
    final map = await db.query(
      tableNotes,
      columns: NotesField.values,
      where: '${NotesField.id} = ?',
      whereArgs: [id],
    );
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      throw Exception('ID ${id} not found');
    }
  }

  // to return multi notes
  Future<List<Note>> readAllnotes() async {
    final db = await instance.database;
    final result = await db.query(tableNotes);
    return result.map((json) => Note.fromJson(json)).toList();
  }

  // For return multi notes
  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NotesField.id}= ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return db.delete(tableNotes, where: '${NotesField.id}= ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
