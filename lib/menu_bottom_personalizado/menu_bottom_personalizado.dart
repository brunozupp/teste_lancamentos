import 'package:flutter/material.dart';

class MenuBottomPersonalizado extends StatefulWidget {
  const MenuBottomPersonalizado({ Key? key }) : super(key: key);

  @override
  State<MenuBottomPersonalizado> createState() => _MenuBottomPersonalizadoState();
}

class _MenuBottomPersonalizadoState extends State<MenuBottomPersonalizado> {

  var indexAtual = 0;

  final icons = [
    Icons.access_alarm_rounded,
    Icons.engineering,
    Icons.home,
    Icons.person,
    Icons.graphic_eq
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: width,
          height: 100,
          //color: Colors.purple,
          color: Colors.transparent,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            height: 70,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(var i = 0; i < icons.length; i++)
                  IconButton(
                    icon: Icon(
                      icons[i],
                      color: i == indexAtual ? Colors.transparent: Colors.black,
                    ),
                    onPressed: i == indexAtual ? null : () {
                      setState(() {
                        indexAtual = i;
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: ((width / icons.length) * (indexAtual + 1)) - 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color(0xFFC3D9E6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.42,
                      0.42
                    ]
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle
                ),
                child: Icon(
                  icons[indexAtual],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}