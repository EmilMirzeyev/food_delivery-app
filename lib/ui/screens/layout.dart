import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/screens/main/components/menu_drawer.dart';
import 'package:food_delivery_app/ui/screens/main/main_screen.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);
  static const route = '/layout';

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void toggle() {
    animationController.isDismissed ? animationController.forward() : animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final double maxSlide = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = maxSlide * animationController.value;
          double scale = 1 - (animationController.value * 0.3);
          double angle = animationController.value * (0.4 * pi);
          return Stack(
            children: [
              const MenuDrawer(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale)
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () => animationController.value == 1.0 ? toggle() : null,
                    child: Stack(
                      children: [
                        MainScreen(
                          toggle: () => toggle(),
                        ),
                        animationController.value == 1.0
                            ? Container(
                                color: Colors.transparent,
                              )
                            : const SizedBox()
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
