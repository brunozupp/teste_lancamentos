import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              print("Clicou aqui no maior");
            },
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.blue[900],
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {
                print("Camera ou Galeria");
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}