import 'package:flutter/material.dart';
import 'package:teste_lancamentos/checkbox_custom/checkbox_custom_page.dart';
import 'package:teste_lancamentos/checkbox_flutter/checkbox_tile_flutter_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      home: const CheckboxCustomPage(),
      locale: const Locale("pt","BR"),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale("pt", "BR"),
        Locale('en'),
      ]
    );
  }
}
