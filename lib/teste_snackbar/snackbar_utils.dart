import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_lancamentos/teste_snackbar/snackbar_card_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarUtils {

  SnackBarUtils._();

  static void showSnackbar({
    required BuildContext context, 
    required SnackbarCustomModal snackbarCustomModal
  }) {

    showTopSnackBar(
      context,
      Material(
        type: MaterialType.transparency,
        child: SnackbarCardWidget(snackbarCustomModal: snackbarCustomModal)
      ),
      displayDuration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 3, milliseconds: 750), () {
      if(snackbarCustomModal.onHidden != null) {
        snackbarCustomModal.onHidden!();
      }
    });

  }
}

class SnackbarCustomModal {

  final String message;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onHidden;

  SnackbarCustomModal.success(this.message, {this.onHidden}) :
    backgroundColor = Colors.green[300]!,
    icon = Icons.check_circle,
    iconColor = Colors.green[800]!;

  SnackbarCustomModal.error(this.message, {this.onHidden}) :
    backgroundColor = Colors.red[200]!,
    icon = Icons.error,
    iconColor = Colors.red[800]!;

  SnackbarCustomModal.notification(this.message, {this.onHidden}) :
    backgroundColor = Colors.blue[300]!,
    icon = Icons.warning_rounded,
    iconColor = Colors.blue[900]!;
}