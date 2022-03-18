import 'package:flutter/material.dart';
import 'package:teste_lancamentos/glassmorphism_teste/glass_morphism.dart';

class TesteGlassMorphism extends StatelessWidget {

  const TesteGlassMorphism({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    print(width);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _gerarContainer(Colors.red),
                _gerarContainer(Colors.blue),
                _gerarContainer(Colors.yellow),
                _gerarContainer(Colors.purple),
                _gerarContainer(Colors.black),
                _gerarContainer(Colors.grey),
                _gerarContainer(Colors.green),
                _gerarContainer(Colors.red),
                _gerarContainer(Colors.blue),
                _gerarContainer(Colors.yellow),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: width
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20
                ),
                child: GlassMorphism(
                  blur: 20,
                  opacity: 0.2,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.purple.withOpacity(0.5),
                  ),
                  color: Colors.purple,
                  child: ElevatedButton(
                    onPressed: () {}, 
                    child: const Text(
                      "Botão Grassmorphism",
                    ),
                    style: ButtonStyle(
                      // Tem que estar com o transparente na cor do botão
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      minimumSize: MaterialStateProperty.all<Size>(
                         Size(width, 56),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 18
                      ))
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _gerarContainer(Color color) {
    return Container(
      width: double.infinity,
      height: 200,
      color: color,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
    );
  }
}