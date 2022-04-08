import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app/helpers/enums/snackbar_type_enum.dart';
import '/ui/utils/constraints/ui_media.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({Key? key, required this.content, required this.type}) : super(key: key);

  final String content;
  final SnackbarType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 17.0),
      child: type == SnackbarType.success
          ? Row(
              children: [
                SvgPicture.asset(
                  UiMedia.instance.checkPath,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  content,
                ),
              ],
            )
          : type == SnackbarType.error
              ? Row(
                  children: [
                    SvgPicture.asset(
                      UiMedia.instance.xPath,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      content,
                    ),
                  ],
                )
              : Row(
                  children: [
                    SvgPicture.asset(
                      UiMedia.instance.infoCircleOutlinedPath,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      content,
                    ),
                  ],
                ),
    );
  }
}