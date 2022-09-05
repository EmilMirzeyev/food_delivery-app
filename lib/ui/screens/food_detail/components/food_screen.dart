import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/view_models/concrency/food_viewmodel.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key, this.foodViewModel}) : super(key: key);
  static const route = '/food-screen';
  final FoodViewModel? foodViewModel;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    widget.foodViewModel!.updateUi = setState;
    widget.foodViewModel!.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodViewModel? vm = widget.foodViewModel;
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            leading: InkWell(
              onTap: () => AppDiContainer.instance.appRouter.pop(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  backgroundColor: UiConstraints.instance.kfe734c,
                  radius: 10.0,
                  child: Icon(
                    Icons.arrow_back,
                    color: UiConstraints.instance.kfff,
                  ),
                ),
              ),
            ),
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    vm!.food.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    vm.food.title,
                    style: UiConstraints.instance.px18w600k171718,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    vm.food.recipe,
                    style: UiConstraints.instance.px14w600k617282,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${vm.food.price}',
                        style: UiConstraints.instance.px14w600kfe734c,
                      ),
                      RatingBar.builder(
                        initialRating: vm.food.rating.rate!,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                        itemSize: 20.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Divider(
                    color: UiConstraints.instance.kc4c4c4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details",
                        style: UiConstraints.instance.px18w600k171718,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          const Text("Quantity"),
                          const SizedBox(
                            width: 16.0,
                          ),
                          ClipOval(
                            child: Material(
                              color: vm.qty == 1 ? UiConstraints.instance.kc4c4c4 : UiConstraints.instance.kfe734c, // Button color
                              child: InkWell(
                                onTap: () => vm.updateCount(-1),
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
                            child: Text(vm.qty.toString()),
                          ),
                          ClipOval(
                            child: Material(
                              color: UiConstraints.instance.kfe734c, // Button color
                              child: InkWell(
                                onTap: () => vm.updateCount(1),
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
                          const Spacer(),
                          Row(
                            children: [
                              const Text("Total price"),
                              const SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                '\$${num.parse((vm.qty! * vm.food.price).toStringAsFixed(2))}',
                                style: UiConstraints.instance.px14w600kfe734c,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
                    onTap: () {
                      vm.addToCart();
                      vm.addToBasketCommand.doExecute(
                        {
                          "product": vm.food,
                          "mvm": vm.mainViewModel,
                          "bvm": vm.basketViewModel,
                          "vm": vm,
                        },
                      );
                    },
                    child: SizedBox(
                      height: 38.0,
                      child: Center(
                        child: Text(
                          vm.basketViewModel.basket.contains(vm.food) ? "Added" : "Add to cart",
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
                        "Place order",
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
