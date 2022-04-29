import 'package:flutter/material.dart';

class MenuPerfumado extends StatefulWidget {
  const MenuPerfumado({ Key? key }) : super(key: key);

  @override
  State<MenuPerfumado> createState() => _MenuPerfumadoState();
}

class _MenuPerfumadoState extends State<MenuPerfumado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Perfumado"),
      ),
    );
  }
}