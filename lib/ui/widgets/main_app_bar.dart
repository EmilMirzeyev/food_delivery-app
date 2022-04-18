import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_media.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key, required this.onLeading, this.icon}) : super(key: key);
  final Function onLeading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onLeading(),
          child: Container(
            height: 42.0,
            width: 42.0,
            decoration: BoxDecoration(
              color: UiConstraints.instance.kf8f8f8,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(child: icon),
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
    );
  }
}
