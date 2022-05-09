import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MenuPerfumadoPage extends StatefulWidget {
  const MenuPerfumadoPage({ Key? key }) : super(key: key);

  @override
  State<MenuPerfumadoPage> createState() => _MenuPerfumadoPageState();
}

class _MenuPerfumadoPageState extends State<MenuPerfumadoPage> with SingleTickerProviderStateMixin {

  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  @override
  void initState() {
    super.initState();
    // final systemTheme = SystemUiOverlayStyle.light.copyWith(
    //   systemNavigationBarColor: HexColor('#373A36'),
    //   systemNavigationBarIconBrightness: Brightness.light,
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Perfumado"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(var i = 1; i <= 9; i++)
              Container(
                width: 200,
                height: 200,
                color: Colors.blue[i * 100],
              ),
          ],
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          
          backgroundColor: const Color(0XFFFFA400),
          child: const Icon(
            Icons.brightness_3,
            color: Color(0XFF373A36),
          ),
          onPressed: () {
            _animationController.reset();
            _animationController.forward();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? const Color(0XFFFFA400) : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "brightness $index",
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              )
            ],
          );
        },
        backgroundColor: const Color(0XFF373A36),
        activeIndex: _bottomNavIndex,
        splashColor: const Color(0XFFFFA400),
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 900,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.end,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}