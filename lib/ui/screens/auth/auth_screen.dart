import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/helpers/enums/auth_page_type.dart';
import 'package:food_delivery_app/ui/screens/auth/components/forgot_password_widget.dart';
import '/ui/screens/auth/components/sign_in_widget.dart';
import '/ui/screens/auth/components/sign_up_widget.dart';
import '/ui/view_models/concrency/auth_viewmodel.dart';
import '/ui/utils/constraints/ui_constraints.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const route = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthViewModel _authViewModel;
  @override
  void initState() {
    _authViewModel = AuthViewModel();
    _authViewModel.updateUi = setState;
    _authViewModel.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [UiConstraints.instance.kfff, UiConstraints.instance.kccddff],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          if (_authViewModel.authPageType == AuthPageType.signin) SignInWidget(authViewModel: _authViewModel),
          if (_authViewModel.authPageType == AuthPageType.signup) SignUpWidget(authViewModel: _authViewModel),
          if (_authViewModel.authPageType == AuthPageType.forgotpassword) ForgotPasswordWidget(authViewModel: _authViewModel),
        ],
      ),
    );
  }
}
