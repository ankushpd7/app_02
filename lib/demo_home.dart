import 'package:flutter/material.dart';

class DemoHome extends StatelessWidget {
  const DemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar:AppBar(title: Text('App for use GridView'),),
        body: GridView.count(crossAxisCount: 2,children: [
          colore(Colors.green),
          colore(Colors.blue),
          colore(Colors.red),
          colore(Colors.purple),
          colore(Colors.yellow),
          colore(Colors.orange),
          colore(Colors.green),
          colore(Colors.blue),
          colore(Colors.red),
          colore(Colors.purple),
          colore(Colors.yellow),
          colore(Colors.orange),
        ],),
      ),
    );
  }

  Padding colore(Colors) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: Colors,),
        );
  }
}
