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

  bool error = false;
  bool loading = false;

  // @override
  // void initState() {
  //   super.initState();

  //   setState(() {
  //     loading = true;
  //   });

  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }
  
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
                      // child: file == null ? const Icon(
                      //   Icons.person,
                      //   color: Colors.white,
                      //   size: 50,
                      // ) : null,
                      child: _buildStatus(),
                      // onBackgroundImageError: loading ? null : (object, stackTrace) {
                      //   print("ERRO");
                      //   setState(() {
                      //     error = true;
                      //   });
                      // },
                      // backgroundImage: loading ? null : const NetworkImage("https://narutokonoha.com/wp-content/uploads/2019/1/Imagens-do-anime-Naruto-para-Imprimir-e-Colorir.jpg"),
                      //backgroundImage: file != null ? FileImage(file!) : null,
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

  Widget _buildStatus() {

    // if(loading) {
    //   print("LOADING DAS INFORMAÇÕES PESSOAIS");
    //   return const CircularProgressIndicator();
    // }

    return Image.network(
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      loadingBuilder: (context, child, loadingProgress) {

        if (loadingProgress == null) {
        print(child.runtimeType);

          return ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox.fromSize(
              size: Size.fromRadius(70),
              child: child,
            ),
          );
        }
        
        print("LOADING");
        return const CircularProgressIndicator();
      },
      errorBuilder: (context, child, stackTrace) {
        print("ERROR");
        return Icon(
          Icons.error,
          color: Colors.white,
          size: 50,
        );
      },
      
      fit: BoxFit.fill,
    );

    // return Icon(
    //   error
    //   ? Icons.error
    //   : Icons.engineering,
    //   color: Colors.white,
    //   size: 50,
    // );

    // if(file == null) {
    //   return const Icon(
    //     Icons.person,
    //     color: Colors.white,
    //     size: 50,
    //   );
    // }

    // return Image.file(
    //   file
    // );
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