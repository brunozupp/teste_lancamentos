import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_lancamentos/foto/foto_page.dart';
import 'package:teste_lancamentos/menu_bottom_personalizado/menu_bottom_page.dart';
import 'package:teste_lancamentos/menu_perfumado/menu_perfumado_page.dart';
import 'package:teste_lancamentos/perfil/perfil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuBottomPage(),
      locale: const Locale("pt","BR"),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale("pt", "BR"),
        Locale('en'),
      ]
    );
  }
}
