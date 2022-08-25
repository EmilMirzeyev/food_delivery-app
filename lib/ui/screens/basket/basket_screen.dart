import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';
import 'package:food_delivery_app/ui/widgets/main_app_bar.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key, this.basketViewModel}) : super(key: key);
  static const route = '/basket-screen';
  final BasketViewModel? basketViewModel;

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  void initState() {
    widget.basketViewModel!.updateUi = setState;
    widget.basketViewModel!.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final BasketViewModel? _vm = widget.basketViewModel;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: MainAppBar(
          icon: Icon(
            Icons.arrow_back,
            color: UiConstraints.instance.k171718,
          ),
          onLeading: () => AppDiContainer.instance.appRouter.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Column(
            children: [
              ..._vm!.basket.map((food) {
                return Container(
                  width: _size.width,
                  height: 100.0,
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: UiConstraints.instance.kfff,
                    boxShadow: [
                      BoxShadow(
                        color: UiConstraints.instance.kc4c4c4.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            food.imageUrl,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(food.title),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              food.recipe,
                              style: UiConstraints.instance.px11w500k617282,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              '\$${food.quantity! * food.price}',
                              style: UiConstraints.instance.px12w600k3a4f66,
                            ),
                            Row(
                              children: [
                                ClipOval(
                                  child: Material(
                                    color: food.quantity == 1 ? UiConstraints.instance.kc4c4c4 : UiConstraints.instance.kfe734c, // Button color
                                    child: InkWell(
                                      onTap: () => _vm.updateCount(-1, food),
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: Center(
                                          child: Text(
                                            "-",
                                            style: UiConstraints.instance.px14w600kffffff,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(food.quantity.toString()),
                                ),
                                ClipOval(
                                  child: Material(
                                    color: UiConstraints.instance.kfe734c, // Button color
                                    child: InkWell(
                                      onTap: () => _vm.updateCount(1, food),
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: Center(
                                          child: Text(
                                            "+",
                                            style: UiConstraints.instance.px14w600kffffff,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Row(
          children: [
            Expanded(
              child: Material(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: UiConstraints.instance.kfe734c,
                    ),
                    borderRadius: UiConstraints.instance.borderRadius,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 38.0,
                      child: Center(
                        child: Text(
                          "Total ${_vm.basket.fold(0, (sum, el) => (el.price * el.quantity) + sum!)}",
                          style: UiConstraints.instance.px14w600kfe734c,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Material(
                color: UiConstraints.instance.kfe734c, // Button color
                borderRadius: UiConstraints.instance.borderRadius,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 42.0,
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: UiConstraints.instance.px14w600kffffff,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
