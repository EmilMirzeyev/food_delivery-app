import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/ui/pages/home/home_page.dart';
import 'package:food_delivery_app/ui/screens/main/components/menu_drawer.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_media.dart';
import 'package:food_delivery_app/ui/widgets/main_app_bar.dart';
import '/ui/view_models/concrency/main_viemodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.toggle}) : super(key: key);
  static const route = '/main-screen';

  final Function? toggle;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late MainViewModel _mainViewModel;
  late AnimationController animationController;

  @override
  void initState() {
    _mainViewModel = MainViewModel(updateUi: setState);
    _mainViewModel.initialize();
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
          double angle = animationController.value * (0.35 * pi);
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
                      PhysicalModel(
                        color: UiConstraints.instance.kfe734c,
                        elevation: 8.0,
                        shadowColor: UiConstraints.instance.kfe734c.withOpacity(0.5),
                        child: Scaffold(
                          extendBody: true,
                          appBar: AppBar(
                            elevation: 0,
                            title: MainAppBar(
                              icon: AnimatedIcon(
                                icon: AnimatedIcons.menu_close,
                                progress: animationController,
                                size: 28.0,
                                color: UiConstraints.instance.k171718,
                              ),
                              onLeading: toggle,
                            ),
                          ),
                          body: HomePage(mainViewModel: _mainViewModel),
                          floatingActionButton: FloatingActionButton(
                            backgroundColor: UiConstraints.instance.kfe734c,
                            onPressed: () => _mainViewModel.goToBasketScreenCommand.doExecute({"vm": _mainViewModel}),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    UiMedia.instance.shoppingPath,
                                    color: UiConstraints.instance.kfff,
                                    width: 28.0,
                                  ),
                                ),
                                _mainViewModel.basketViewModel!.basket.isNotEmpty
                                    ? Positioned(
                                        top: -3.0,
                                        right: -3.0,
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(555.0),
                                            color: UiConstraints.instance.kccddff,
                                          ),
                                          child: FittedBox(
                                              child: Text(
                                            _mainViewModel.basketViewModel!.basket.length.toString(),
                                            style: UiConstraints.instance.px18w600k171718,
                                          )),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
                          bottomNavigationBar: BottomAppBar(
                            elevation: 25.0,
                            notchMargin: 6.0,
                            color: UiConstraints.instance.kf8f8f8,
                            shape: const CircularNotchedRectangle(),
                            child: SizedBox(
                              height: 60.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        UiMedia.instance.homePath,
                                        color: UiConstraints.instance.k3a4f66,
                                        width: 28.0,
                                      ),
                                      onPressed: () {},
                                      color: UiConstraints.instance.k171718,
                                      iconSize: 30.0,
                                      splashRadius: 0.1,
                                      highlightColor: Colors.transparent,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: UiConstraints.instance.k3a4f66,
                                      ),
                                      onPressed: () {},
                                      color: UiConstraints.instance.k171718,
                                      iconSize: 30.0,
                                      splashRadius: 0.1,
                                      highlightColor: Colors.transparent,
                                    ),
                                    const SizedBox(
                                      width: 26.0,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit_note,
                                        color: UiConstraints.instance.k3a4f66,
                                      ),
                                      onPressed: () {},
                                      color: UiConstraints.instance.k171718,
                                      iconSize: 30.0,
                                      splashRadius: 0.1,
                                      highlightColor: Colors.transparent,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.person,
                                        color: UiConstraints.instance.k3a4f66,
                                      ),
                                      onPressed: () {},
                                      color: UiConstraints.instance.k171718,
                                      iconSize: 30.0,
                                      splashRadius: 0.1,
                                      highlightColor: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      animationController.value == 1.0
                          ? Container(
                              color: Colors.transparent,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
