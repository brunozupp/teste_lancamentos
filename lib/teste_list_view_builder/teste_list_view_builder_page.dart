import 'package:flutter/material.dart';

class TesteListViewBuilderPage extends StatelessWidget {
  const TesteListViewBuilderPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Builder"),
      ),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (_,index) {

          print("Aqui o index $index");

          return ListTile(
            title: Text("Item: $index"),
            leading: const CircleAvatar(),
            subtitle: const Text("Alguma coisa aqui"),
          );
        }
      ),
    );
  }
}