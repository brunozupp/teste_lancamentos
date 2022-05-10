import 'package:flutter/material.dart';

class MenuBottomPersonalizado extends StatefulWidget {
  const MenuBottomPersonalizado({ Key? key }) : super(key: key);

  @override
  State<MenuBottomPersonalizado> createState() => _MenuBottomPersonalizadoState();
}

class _MenuBottomPersonalizadoState extends State<MenuBottomPersonalizado> {

  var indexAtual = 0;

  List<_Icone> icons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    icons = [
      Icons.access_alarm_rounded,
      //Icons.engineering,
      //Icons.home,
      Icons.person,
      Icons.graphic_eq
    ].map((e) => _Icone(
      icon: e,
      key: GlobalKey(),
    )).toList();
  }

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
                  Expanded(
                    child: GestureDetector(
                      onTap: i == indexAtual ? null : () {
                        setState(() {
                          indexAtual = i;
                        });
                      },
                      child: Column(
                        children: [
                          const Spacer(),
                          Icon(
                            icons[i].icon,
                            key: icons[i].key,
                            color: i == indexAtual ? Colors.transparent: Colors.black,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            visible: i != indexAtual,
                            child: const Text(
                              "Algum",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        AnimatedPositioned(
          duration: const Duration(milliseconds: 600),
          width: 100,
          bottom: 30,
          left: _position(icons[indexAtual].key),
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
                  icons[indexAtual].icon,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double? _getOffsetX(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    Offset? position = box?.localToGlobal(Offset.zero);
    return position?.dx;
  }

  // Para 4 ícones
  double _position(GlobalKey key) {

    final iconPosition = _getOffsetX(key);

    if(indexAtual == 0) {
      return iconPosition == null ? 3 : iconPosition - 35;
    }

    if(indexAtual == icons.length - 1) {
      return iconPosition! - 40;
    }

    return iconPosition! - 35;
  }
}

class _Icone {

  final IconData icon;
  final GlobalKey key;

  _Icone({
    required this.icon,
    required this.key,
  });
}
