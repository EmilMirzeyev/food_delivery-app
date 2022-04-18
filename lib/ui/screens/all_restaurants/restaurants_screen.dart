import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/widgets/main_app_bar.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MainAppBar(
          icon: Icon(
            Icons.arrow_back,
            color: UiConstraints.instance.k171718,
          ),
          onLeading: () => AppDiContainer.instance.appRouter.pop(),
        ),
      ),
      body: const Center(
        child: Text('Body'),
      ),
    );
  }
}
