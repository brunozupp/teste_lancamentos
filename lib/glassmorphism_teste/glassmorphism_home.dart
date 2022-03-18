import 'package:flutter/material.dart';
import 'package:teste_lancamentos/glassmorphism_teste/glass_morphism.dart';

class GlassmorphismHome extends StatefulWidget {

  const GlassmorphismHome({ Key? key }) : super(key: key);

  @override
  State<GlassmorphismHome> createState() => _GlassmorphismHomeState();
}

class _GlassmorphismHomeState extends State<GlassmorphismHome> {
  
  bool _isBlur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Stack(
            children: [
              Image.network(
                "https://wallpaperaccess.com/full/1682077.png",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),

              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isBlur = !_isBlur;
                    });
                  },
                  child: GlassMorphism(
                    blur: _isBlur ? 20 : 0,
                    opacity: 0.2,
                    child: const SizedBox(
                      height: 210,
                      width: 320,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}