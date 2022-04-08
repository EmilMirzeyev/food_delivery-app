
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/utils/constraints/ui_constraints.dart';
import 'package:flutter_application_1/ui/view_models/concrency/auth_viewmodel.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    Key? key,
    required this.authViewModel,
  }) : super(key: key);

  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SIGN IN',
                style: UiConstraints.instance.px24w600k3a4f66,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Complete this step for best adjustment.',
                style: UiConstraints.instance.px12w600k3a4f66,
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 32.0,
                ),
                decoration: BoxDecoration(
                  color: UiConstraints.instance.kfff,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Your Email',
                          style: UiConstraints.instance.px14w600k3a4f66,
                        ),
                      ),
                      TextFormField(
                        cursorColor: UiConstraints.instance.k3a4f66,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor: UiConstraints.instance.kf8f8f8,
                          hintText: 'Email Address...',
                          prefixIcon: Icon(Icons.mail, color: UiConstraints.instance.kfe734c),
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Password',
                          style: UiConstraints.instance.px14w600k3a4f66,
                        ),
                      ),
                      TextFormField(
                        obscureText: authViewModel.obscure,
                        cursorColor: UiConstraints.instance.k3a4f66,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor: UiConstraints.instance.kf8f8f8,
                          hintText: 'Password...',
                          prefixIcon: Icon(Icons.password, color: UiConstraints.instance.kfe734c),
                          suffixIcon: InkWell(
                            onTap: () => authViewModel.changeObscure(),
                            child: Icon(Icons.remove_red_eye, color: authViewModel.obscure ? UiConstraints.instance.kc4c4c4 : UiConstraints.instance.kfe734c),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => authViewModel.changeRememberme(),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    width: 35.0,
                                    height: 16.0,
                                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: authViewModel.rememberme ? UiConstraints.instance.kfe734c : UiConstraints.instance.kc4c4c4,
                                    ),
                                    child: AnimatedAlign(
                                      alignment: authViewModel.rememberme ? Alignment.centerRight : Alignment.centerLeft,
                                      duration: const Duration(milliseconds: 150),
                                      child: CircleAvatar(
                                        backgroundColor: UiConstraints.instance.kfff,
                                        radius: 6.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  'Remember me',
                                  style: UiConstraints.instance.px12w400kc4c4c4,
                                )
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot password?',
                                style: UiConstraints.instance.px12w400k171718,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          primary: UiConstraints.instance.kfe734c,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('SIGN IN'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  primary: UiConstraints.instance.k4167b0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: const Text('SIGN IN WITH FACEBOOK'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I don\'t have a account?',
                    style: UiConstraints.instance.px12w600k3a4f66,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: UiConstraints.instance.px12w600kfe734c,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
