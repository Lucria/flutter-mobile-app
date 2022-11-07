import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TemperatureData {
  int? value;
  int? time;

  TemperatureData(this.value, this.time);
  TemperatureData.fromMap(Map result) {
    value = result["value"];
    time = result["time"];
  }

  Map<String, dynamic> toMap() => {
      'value': value,
      'time': time
  };
}

class OxygenData {
  int? value;
  int? time;

  OxygenData(this.value, this.time);
  OxygenData.fromMap(Map result) {
    value = result["value"];
    time = result["time"];
  }

  Map<String, dynamic> toMap() => {
    'value': value,
    'time': time
  };
}

class BpmData {
  int? value;
  int? time;

  BpmData(this.value, this.time);
  BpmData.fromMap(Map result) {
    value = result["value"];
    time = result["time"];
  }

  Map<String, dynamic> toMap() => {
    'value': value,
    'time': time
  };
}

class DatabaseHelper {

  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 2;

  static const temperatureTable = 'temperature';
  static const oxygenTable = 'oxygen';
  static const bpmTable = 'heartRate';
  static const rawSensorTable = 'sensor';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $temperatureTable (
            _id INTEGER PRIMARY KEY,
            value INTEGER NOT NULL,
            time INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $oxygenTable (
            _id INTEGER PRIMARY KEY,
            value INTEGER NOT NULL,
            time INTEGER NOT NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE $bpmTable (
            _id INTEGER PRIMARY KEY,
            value INTEGER NOT NULL,
            time INTEGER NOT NULL
          );
    ''');
    await db.execute('''
          CREATE TABLE $rawSensorTable (
            _id INTEGER PRIMARY KEY,
            value INTEGER NOT NULL
          );
    ''');
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    await db.insert(temperatureTable, TemperatureData(35, currentTime).toMap());
    await db.insert(oxygenTable, OxygenData(100, currentTime).toMap());
    await db.insert(bpmTable, BpmData(60, currentTime).toMap());
    currentTime = DateTime.now().millisecondsSinceEpoch;
    await db.insert(temperatureTable, TemperatureData(33, currentTime).toMap());
    await db.insert(oxygenTable, OxygenData(98, currentTime).toMap());
    await db.insert(bpmTable, BpmData(68, currentTime).toMap());
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database db = await instance.database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<String> queryFirstValue(String table) async {
    Database db = await instance.database;
    var results = await db.query(table, limit: 1, orderBy: "_id DESC");
    if (table == temperatureTable) {
      return TemperatureData.fromMap(results.first).value.toString();
    }
    if (table == oxygenTable) {
      return OxygenData.fromMap(results.first).value.toString();
    }
    return BpmData.fromMap(results.first).value.toString();
  }
}
