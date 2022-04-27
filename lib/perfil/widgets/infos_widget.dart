import 'package:flutter/material.dart';

class InfosWidget extends StatelessWidget {
  const InfosWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Bruno Noveli",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text("Junior Flutter"),
        const SizedBox(
          height: 5,
        ),
        Text(
          "bruno@hotmail.com",
          style: TextStyle(
            color: Colors.blue.shade900,
          ),
        ),
      ],
    );
  }
}