import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teste_lancamentos/env_test/env_vars.dart';

class EnvTestPage extends StatelessWidget {
  const EnvTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("Debug = $kDebugMode");
    print("Profile = $kProfileMode");
    print("Release = $kReleaseMode");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Env Teste"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(EnvVars.title),
            Text(EnvVars.baseUrl),
          ],
        ),
      ),
    );
  }
}