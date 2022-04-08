import 'package:flutter_application_1/ui/view_models/abstraction/i_base_viewmodel.dart';

class AuthViewModel extends BaseViewModel {
  bool obscure = true;
  bool rememberme = false;

  void changeObscure() {
    obscure = !obscure;
    tryUpdateUi();
  }

  void changeRememberme() {
    rememberme = !rememberme;
    tryUpdateUi();
  }

  @override
  void initialize() {}
  AuthViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
