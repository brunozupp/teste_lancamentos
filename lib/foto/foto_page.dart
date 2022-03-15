import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FotoPage extends StatefulWidget {
  const FotoPage({ Key? key }) : super(key: key);

  @override
  State<FotoPage> createState() => _FotoPageState();
}

class _FotoPageState extends State<FotoPage> {
  
  final ImagePicker _picker = ImagePicker();

  File? file;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox Custom"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Clicou aqui no maior");
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue[900],
                      child: file == null ? const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ) : null,
                      backgroundImage: file != null ? FileImage(file!) : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        
                        final source = await _getImageSource(context);

                        if(source != null) {
                          final image = await _picker.pickImage(source: source);

                          if(image != null) {
                            setState(() {
                              file = File(image.path);
                            });
                          }
                        }
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
            ),

            if(file != null)
              Image.file(
                file!,
                fit: BoxFit.cover,
              )

          ],
        ),
      ),
    );
  }

  Widget _buildAvatarImage(File? file) {

    if(file == null) {
      return const Icon(
        Icons.person,
        color: Colors.white,
        size: 50,
      );
    }

    return Image.file(
      file
    );
  }

  Future<ImageSource?> _getImageSource(BuildContext context) async {
    return await showDialog<ImageSource?>(
      context: context, 
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 100.0, 
            vertical: 14.0
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Escolha uma opção",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                      onTap: () => Navigator.of(context).pop(ImageSource.camera), 
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.photo,
                        size: 50,
                      ),
                      onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}