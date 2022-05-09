import 'package:flutter/material.dart';
import 'package:teste_lancamentos/menu_bottom_personalizado/menu_bottom_personalizado.dart';

class MenuBottomPage extends StatelessWidget {
  const MenuBottomPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Personalizado"),
      ),
      backgroundColor: Color(0xFFC3D9E6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(var i = 1; i <= 9; i++)
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  width: 200,
                  height: 200,
                  color: Colors.blue[i * 100],
                ),
              ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: MenuBottomPersonalizado(),
    );
  }
}