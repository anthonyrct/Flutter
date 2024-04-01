import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Model.dart';

class DatabaseHelper{
  static const String DATABASE_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'configuracoes';
  static const String
  CREATE_CONTACTS_TABLE_SCRIPT = 
  "CREATE TABLE configuracoes(id SERIAL PRIMARY KEY,"+
  "name TEXT, email TEXT, senha TEXT"
  ) "
}