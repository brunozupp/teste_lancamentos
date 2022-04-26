import 'package:flutter/material.dart';

class InfosWidget extends StatelessWidget {
  const InfosWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Bruno Noveli"),
        Text("Junior Flutter"),
        Text("bruno@hotmail.com")
      ],
    );
  }
}