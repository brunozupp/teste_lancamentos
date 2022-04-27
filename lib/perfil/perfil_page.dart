import 'package:flutter/material.dart';
import 'package:teste_lancamentos/perfil/widgets/infos_widget.dart';
import 'package:teste_lancamentos/perfil/widgets/metrics_widget.dart';
import 'package:teste_lancamentos/perfil/widgets/photo_widget.dart';

class PerfilPage extends StatefulWidget {
  
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag Drop"),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [

            const SizedBox(
              height: 150,
            ),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: const [

                      SizedBox(
                        height: 100,
                      ),

                      InfosWidget(),

                      MetricsWidget(),
                    ],
                  ),
                ),
                
                const Positioned(
                  top: -80,
                  left: 0,
                  right: 0,
                  child: PhotoWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}