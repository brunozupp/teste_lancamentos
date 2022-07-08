import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_lancamentos/state_app_teste/app_navigator.dart';
import 'package:teste_lancamentos/state_app_teste/app_repository.dart';
import 'package:teste_lancamentos/state_app_teste/app_verification_jwt.dart';
import 'package:teste_lancamentos/teste_painel/teste_painel_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late AppVerificationJwt appVerificationJwt;

  @override
  void initState() {
    super.initState();

    appVerificationJwt = AppVerificationJwt(
      repository: AppRepository(),
    );

    // Vai ficar observando a classe SqliteAdmConnection para ver quando fechar
    // a conexão com o banco de dados
    WidgetsBinding.instance.addObserver(appVerificationJwt);
  }

  @override
  void dispose() {

    WidgetsBinding.instance.removeObserver(appVerificationJwt);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatiorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestePainelPage(),
      locale: const Locale("pt","BR"),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale("pt", "BR"),
        Locale('en'),
      ]
    );
  }
}