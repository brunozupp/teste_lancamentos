import 'package:flutter/material.dart';
import 'package:teste_lancamentos/perfil/perfil_page.dart';
import 'package:teste_lancamentos/state_app_teste/app_navigator.dart';

import 'package:teste_lancamentos/state_app_teste/app_repository.dart';

class AppVerificationJwt with WidgetsBindingObserver {
  
  final AppRepository repository;

  AppVerificationJwt({
    required this.repository,
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {

    print(state.name);

    switch(state) {

      case AppLifecycleState.resumed:
        executarResumed();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }


    super.didChangeAppLifecycleState(state);
  }

  Future<void> executarResumed() async {
    final resultado = await repository.obterResposta();
    final String mensagem;

    if(resultado) {
      mensagem = "Token ainda é válido";
    } else {
      mensagem = "Token não é mais válido";
    }

    final duration = Duration(seconds: 1);

    ScaffoldMessenger.of(AppNavigator.currentContext).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: duration,
      ),
    );

    if(!resultado) {
      Future.delayed(duration, () {
        AppNavigator.to.push(MaterialPageRoute(builder: (_) => const PerfilPage()));
        //Navigator.of(AppNavigator.currentContext).push(MaterialPageRoute(builder: (_) => const PerfilPage()));
      });
    }

  }
}
