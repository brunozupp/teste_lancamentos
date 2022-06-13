import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teste_lancamentos/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final String filename;

  if(kReleaseMode) {
    filename = "envs/.env_prod";
  } else {
    filename = "envs/.env_dev";
  }

  await dotenv.load(fileName: filename);

  runApp(const App());
}
