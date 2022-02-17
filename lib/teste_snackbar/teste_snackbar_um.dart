import 'package:flutter/material.dart';
import 'package:teste_lancamentos/teste_snackbar/snackbar_utils.dart';
import 'package:teste_lancamentos/teste_table_calendar/teste_table_calendar_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TesteSnackbarUm extends StatelessWidget {

  const TesteSnackbarUm({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                    message: "Sucesso na abertura do chamado!",
                    backgroundColor: Colors.green[200]!,
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green[800],
                    ),
                    iconPositionLeft: 25,
                    iconRotationAngle: 0,
                  ),
                );
              }, 
              child: const Text("Mostrar snackbar sucesso"),
            ),

            ElevatedButton(
              onPressed: () {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: "Erro na abertura do chamado!",
                    backgroundColor: Colors.red[200]!,
                    messagePadding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.error,
                      color: Colors.red[800],
                    ),
                    iconPositionLeft: 25,
                    iconRotationAngle: 0,
                  ),
                );
              }, 
              child: const Text("Mostrar snackbar erro"),
            ),
            ElevatedButton(
              onPressed: () {
                SnackBarUtils.showSnackbar(
                  context: context, 
                  snackbarCustomModal: SnackbarCustomModal.error("Mensagem de erro")
                );
              }, 
              child: const Text("Mostrar snackbar customizado - erro"),
            ),
            ElevatedButton(
              onPressed: () {
                SnackBarUtils.showSnackbar(
                  context: context, 
                  snackbarCustomModal: SnackbarCustomModal.success("Mensagem de sucesso")
                );
              }, 
              child: const Text("Mostrar snackbar customizado - sucesso"),
            ),
            ElevatedButton(
              onPressed: () {
                SnackBarUtils.showSnackbar(
                  context: context, 
                  snackbarCustomModal: SnackbarCustomModal.notification(
                    "Mensagem de notificação",
                    onHidden: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TesteTableCalendarPage()));
                    }
                  ),
                );
              }, 
              child: const Text("Mostrar snackbar customizado - notificacao"),
            ),
          ],
        ),
      )
    );
  }
}