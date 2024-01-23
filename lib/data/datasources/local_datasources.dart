import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note_data.dart';

class LocalDataSources {
  final String dbname = 'notes_local01.db';
  final String tableName = 'notes';

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbname);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT, 
          content TEXT, 
          createAt TEXT)''',
        );
      },
    );
  }

  // insert data
  Future<int> insertNote(Note note) async {
    final db = await _openDatabase();
    return await db.insert(tableName, note.toMap());
  }

  // get data
  Future<List<Note>> getNotes() async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, orderBy: "createAt DESC");
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  // get note by id
  Future<Note> getNoteById(int id) async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return Note.fromMap(maps.first);
  }

  // update note
  Future<int> updateNoteById(Note note) async {
    final db = await _openDatabase();
    return await db.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // delete note
  Future<int> deleteNoteById(int id) async {
    final db = await _openDatabase();
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
