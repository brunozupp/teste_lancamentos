import 'package:flutter/material.dart';
import 'package:teste_lancamentos/perfil/widgets/infos_widget.dart';
import 'package:teste_lancamentos/perfil/widgets/metrics_widget.dart';
import 'package:teste_lancamentos/perfil/widgets/photo_widget.dart';

class DragDropPage extends StatefulWidget {
  
  const DragDropPage({Key? key}) : super(key: key);

  @override
  State<DragDropPage> createState() => _DragDropPageState();
}

class _DragDropPageState extends State<DragDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag Drop"),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Stack(
              children: [
                PhotoWidget(),
                Card(
                  child: Column(
                    children: [

                      InfosWidget(),

                      MetricsWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}