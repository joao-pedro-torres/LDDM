import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)?.settings.arguments as String;
    List _itens = [];

    void _loadItens() {
      _itens = [];
      for(int i = 0; i < 20; i++) {
        Map<String, dynamic> item = {
          'title': 'Tile $i',
          'subtitle': 'This is the tile number $i'
        };
        _itens.add(item);
      }
    }

    _loadItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo(a), $name", style: const TextStyle(fontSize: 26)),
      ),
      drawer: const Drawer(),
      body: Container(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(itemCount: _itens.length, itemBuilder: (context, idx) {
          return ListTile(
            title: Text(_itens[idx]['title']),
            subtitle: Text(_itens[idx]['subtitle']),
            onTap: () => showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('Alerta'),
                content: Text('Você cliclou no item $idx,'),
                actions: [
                  TextButton(
                      child: const Text("Sim"),
                      onPressed: () => Navigator.pop(context)
                  ),
                  TextButton(
                      child: const Text("Não"),
                      onPressed: () => Navigator.pop(context)
                  )
                ],
              );
            }),
          );
        })
      )
    );
  }
}