import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_media.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key, required this.searchDelegateWidget}) : super(key: key);
  final SearchDelegate<dynamic> searchDelegateWidget;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 42.0,
      decoration: BoxDecoration(
        color: UiConstraints.instance.kf8f8f8,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => showSearch(context: context, delegate: searchDelegateWidget),
              child: SizedBox(
                height: 42.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.search,
                        color: UiConstraints.instance.kc4c4c4,
                      ),
                    ),
                    Text(
                      'Find Your Food',
                      style: UiConstraints.instance.px14w400kc4c4c4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(),
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: SvgPicture.asset(
                  UiMedia.instance.filtersPath,
                  color: UiConstraints.instance.kfe734c,
                  width: 24.0,
                )),
          )
        ],
      ),
    );
  }
}
