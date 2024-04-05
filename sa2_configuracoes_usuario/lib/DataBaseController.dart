import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Model.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'usuario.db';
  static const String TABLE_NAME = 'configuracoes';
  static const String CREATE_CONFIGURACOES_TABLE_SCRIPT =
      "CREATE TABLE configuracoes(id SERIAL PRIMARY KEY," +
          "name TEXT, email TEXT, senha TEXT," +
          "tema TEXT, idioma TEXT, fonte TEXT)";
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_CONFIGURACOES_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

// Método para criar um novo contato no banco de dados
  Future<void> create(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NAME, model.toMap());
    } catch (ex) {
      print(ex);
      return;
    }
  }

  //metodo para obter todos os contatos do banco de dados
  Future<List<ContactModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

      return List.generate(
        maps.length,
        (i) {
          return ContactModel.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um contato no banco de dados
  Future<void> update(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para excluir um contato do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
