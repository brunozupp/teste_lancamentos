import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuBottomPersonalizado extends StatefulWidget {
  const MenuBottomPersonalizado({ Key? key }) : super(key: key);

  @override
  State<MenuBottomPersonalizado> createState() => _MenuBottomPersonalizadoState();
}

class _MenuBottomPersonalizadoState extends State<MenuBottomPersonalizado> {

  int indexAtual = 1;

  List<_Icone> icons = [];

  @override
  void initState() {
    super.initState();

    icons = [
      Icons.build_rounded,
      Icons.add_rounded,
      Icons.person
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
          height: 110,
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
                            color: i == indexAtual ? Colors.transparent: const Color(0xFF0B4C81),
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
          bottom: 25,
          left: _position(icons[indexAtual].key),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
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
                      0.5,
                      0.5
                    ]
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2CA8FF),
                      Color(0xFF0B4C81),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return AlignTransition(
                      alignment: Tween<AlignmentGeometry>(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.linear,
                        ),
                      ), 
                      child: child
                    );
                  },
                  child: Icon(
                    icons[indexAtual].icon,
                    key: ValueKey(icons[indexAtual]),
                    color: Colors.white,
                    size: 35,
                  ),
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

  double _position(GlobalKey key) {

    var iconPosition = _getOffsetX(key);

    iconPosition ??= (MediaQuery.of(context).size.width / 2) - 12;

    if(indexAtual == 0) {
      return iconPosition - 35;
    }

    if(indexAtual == icons.length - 1) {
      return iconPosition - 30;
    }

    return iconPosition - 35;
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
