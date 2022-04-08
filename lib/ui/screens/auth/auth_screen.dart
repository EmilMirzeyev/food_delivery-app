import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/view_models/concrency/auth_viewmodel.dart';
import '/ui/screens/auth/components/sign_in_widget.dart';
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
          SignInWidget(authViewModel: _authViewModel),
        ],
      ),
    );
  }
}
