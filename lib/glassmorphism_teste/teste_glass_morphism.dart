import 'package:flutter/material.dart';
import 'package:teste_lancamentos/glassmorphism_teste/glass_morphism.dart';

enum Empresa {
  deal,
  ambev,
  gft,
  will,
  nubank,
}

class TesteGlassMorphism extends StatefulWidget {

  const TesteGlassMorphism({ Key? key }) : super(key: key);

  @override
  State<TesteGlassMorphism> createState() => _TesteGlassMorphismState();
}

class _TesteGlassMorphismState extends State<TesteGlassMorphism> {
  
  var empresa = Empresa.deal;

  String obterDescricao(Empresa empresa) {
    switch(empresa) {
      case Empresa.deal:
        return "Deal";
      case Empresa.ambev:
        return "Ambev";
      case Empresa.gft:
        return "GFT";
      case Empresa.will:
        return "Will";
      case Empresa.nubank:
        return "Nubank";
    }
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Glassmorphism'),
        actions: [
          PopupMenuButton<Empresa>(
            color: Colors.transparent,
            elevation: 0,
            initialValue: empresa,
            onSelected: (Empresa result) { 
              setState(() { 
                empresa = result; 
              }); 
            },
            padding: EdgeInsets.zero,

            itemBuilder: (BuildContext context) => Empresa.values.map((e) {

              //final width = MediaQuery.of(context).size.width;

              return PopupMenuItem<Empresa>(
                child: SizedBox(
                  width: width,
                  child: GlassMorphism(
                    blur: 20, 
                    opacity: 0.5, 
                    color: Colors.white,
                    
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Text(obterDescricao(e)),
                    ),
                  ),
                ),
                padding: EdgeInsets.zero,
                value: e,
              );
            }).toList(),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    obterDescricao(empresa).toUpperCase(),
                  ),
                ),

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
                Row(
                  children: [
                    Expanded(
                      child: _gerarContainer(Colors.green),
                    ),
                    Expanded(
                      child: _gerarContainer(Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
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
                  opacity: 0.1,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.purple.withOpacity(0.5),
                  ),
                  color: Colors.white,
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
                      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                        fontSize: 18
                      )),
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