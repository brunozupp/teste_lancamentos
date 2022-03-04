import 'package:flutter/material.dart';

import 'package:teste_lancamentos/teste_snackbar/snackbar_utils.dart';

class SnackbarCardWidget extends StatefulWidget {

  final SnackbarCustomModal snackbarCustomModal;

  const SnackbarCardWidget({
    Key? key,
    required this.snackbarCustomModal,
  }) : super(key: key);

  @override
  _SnackbarCardWidgetState createState() => _SnackbarCardWidgetState();
}

class _SnackbarCardWidgetState extends State<SnackbarCardWidget> with SingleTickerProviderStateMixin {

  SnackbarCustomModal get snackbarCustomModal => widget.snackbarCustomModal;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      duration: const Duration(seconds: 3, milliseconds: 200), 
      vsync: this
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
          setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Row(
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
          const SizedBox(
            height: 20,
          ),
          LinearProgressIndicator(
            color: Colors.white,
            value: animation.value,
            backgroundColor: Colors.white10,
          ),
        ],
      ),
    );
  }
}