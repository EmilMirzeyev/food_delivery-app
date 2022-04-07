import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/utils/constraints/ui_constraints.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const route = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SIGN IN',
                  style: UiConstraints.instance.px24w600k255,
                ),
                const Text('Complete this step for best adjustment.'),
                Container(
                  color: UiConstraints.instance.kfff,
                  child: Form(
                    child: Column(children: const []),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
