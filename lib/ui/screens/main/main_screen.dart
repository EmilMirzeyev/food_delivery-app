import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/ui/pages/home/home_page.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_media.dart';
import '/ui/view_models/concrency/main_viemodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.toggle}) : super(key: key);
  static const route = '/main-screen';

  final Function? toggle;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainViewModel _mainViewModel;

  @override
  void initState() {
    _mainViewModel = MainViewModel();
    _mainViewModel.updateUi = setState;
    _mainViewModel.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: [
            InkWell(
              onTap: () => widget.toggle!(),
              child: Container(
                height: 42.0,
                width: 42.0,
                decoration: BoxDecoration(
                  color: UiConstraints.instance.kf8f8f8,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.menu,
                  color: UiConstraints.instance.k171718,
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Deliver to',
                          style: UiConstraints.instance.px13w500k171718,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          size: 16.0,
                          color: UiConstraints.instance.k171718,
                        ),
                      ],
                    ),
                    Text(
                      'Parjiat, Housing Estate',
                      style: UiConstraints.instance.px14w600kfe734c,
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
                child: Container(
                  height: 42.0,
                  width: 42.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset(UiMedia.instance.profilePath),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const HomePage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiConstraints.instance.kfe734c,
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset(
            UiMedia.instance.shoppingPath,
            color: UiConstraints.instance.kfff,
            width: 28.0,
          ),
          onPressed: () {},
          color: UiConstraints.instance.k171718,
          iconSize: 30.0,
          splashRadius: 0.1,
          highlightColor: Colors.transparent,
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
    );
  }
}
