import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/start/food_delivery_app.dart';
import '/app/helpers/enums/snackbar_type_enum.dart';
import '/ui/widgets/custom_snackbar.dart';

typedef UpdateUi = void Function(VoidCallback fn);
typedef ShowSnackBar = void Function({String content, SnackbarType type});


abstract class BaseViewModel {
  UpdateUi? updateUi;

  void initialize();

  ShowSnackBar? showSnackBar(
      {String? content, SnackbarType type = SnackbarType.info}) {
    final SnackBar snackBar = SnackBar(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: CustomSnackbar(
        content: content!,
        type: type,
      ),
    );
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    return null;
  }
  void tryUpdateUi() {
    try {
      updateUi!(() {});
    // ignore: empty_catches
    } catch (e) {}
  }

  BaseViewModel({
    this.updateUi,
  });
}

