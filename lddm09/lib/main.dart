import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();

  Future<Database> _recoverDataBase() async {
    final pathDB = await getDatabasesPath();
    final localDB = join(pathDB, 'bank.db');
    var getReturn = await openDatabase(
        localDB,
        version: 1,
        onCreate: (db, dbRecentVersion) {
          String sql = 'CREATE TABLE users ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'name VARCHAR, age INTEGER'
              ')';
          db.execute(sql);
        }
    );
    print('Opened '+getReturn.isOpen.toString());
    return getReturn;
  }


  _saveData(String name, int age) async {
    Database db = await _recoverDataBase();
    Map<String, dynamic> dataUser = {
      'name': name,
      'age': age
    };
    int id = await db.insert('users', dataUser);
    print('saved $id');
  }

  _listUsers() async {
    Database db = await _recoverDataBase();
    String sql = 'SELECT * FROM users';
    List users = await db.rawQuery(sql);
    for(var u in users) {
      print(
          'id: '+u['id'].toString()+
              ' name: '+u['name']+' age: '+
              u['age'].toString()
      );
    }
  }

  _listOneUser(int id) async {
    Database db = await _recoverDataBase();
    List users = await db.query(
        'users',
        columns: ['id', 'name', 'age'],
        where: 'id = ?',
        whereArgs: [id]
    );
    for(var u in users) {
      print(
          'id: '+u['id'].toString()+
              ' name: '+u['name']+
              ' age: '+u['age'].toString()
      );
    }
  }

  _removeUser(int id) async {
    Database db = await _recoverDataBase();
    int getReturn = await db.delete(
        'users',
        where: 'id = ?',
        whereArgs: [id]
    );
    print('itens removed: '+getReturn.toString());
  }

  _updateUser(int id, String name, int age) async {
    Database db = await _recoverDataBase();
    Map<String, dynamic> dataUser = {
      'name': name,
      'age': age
    };
    int getReturn = await db.update(
      'users', dataUser,
      where: 'id = ?',
      whereArgs: ['id']
    );
    print('itens updated: '+getReturn.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(decoration: const InputDecoration(labelText: 'name'), keyboardType: TextInputType.name, controller: _name),
            TextField(decoration: const InputDecoration(labelText: 'age'), keyboardType: TextInputType.number, controller: _age),
            ElevatedButton(onPressed: () => _saveData(_name.text, int.parse(_age.text)), child: const Text('save')),
            ElevatedButton(onPressed: _listUsers, child: const Text('list all')),
            ElevatedButton(onPressed: () => _listOneUser(1), child: const Text('list one')),
            ElevatedButton(onPressed: () => _updateUser(1, _name.text, int.parse(_age.text)), child: const Text('update')),
            ElevatedButton(onPressed: () => _removeUser(1), child: const Text('remove')),

          ],
        ),
      ),
    ));
  }
}
