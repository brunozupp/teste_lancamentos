import 'dart:async';

import 'package:flutter/material.dart';
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
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20
          ),
          decoration: BoxDecoration(
            color: snackbarCustomModal.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 8.0),
                spreadRadius: 1,
                blurRadius: 30,
              ),
            ]
          ),
          child: Row(
            children: [
              Icon(
                snackbarCustomModal.icon,
                color: snackbarCustomModal.iconColor,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  snackbarCustomModal.message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
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