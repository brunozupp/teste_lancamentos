import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_lancamentos/glassmorphism_teste/glassmorphism_home.dart';
import 'package:teste_lancamentos/glassmorphism_teste/teste_glass_morphism.dart';
import 'package:teste_lancamentos/listener_list_view/listener_list_view_builder.dart';
import 'package:teste_lancamentos/spike_graficos/burndow2_grafico.dart';
import 'package:teste_lancamentos/spike_graficos/burndow3_grafico.dart';
import 'package:teste_lancamentos/spike_graficos/burndow_grafico.dart';
import 'package:teste_lancamentos/spike_graficos/cfd_grafico.dart';
import 'package:teste_lancamentos/spike_graficos/consolidado_radar_grafico.dart';
import 'package:teste_lancamentos/spike_graficos/donet_grafico.dart';
import 'package:teste_lancamentos/spike_graficos/progresso_grafico.dart';
import 'package:teste_lancamentos/texto_colorido_background/texto_colorido_background.dart';

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
      home: const DonetGrafico(),
      locale: const Locale("pt","BR"),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale("pt", "BR"),
        Locale('en'),
      ]
    );
  }
}
