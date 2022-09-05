import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/helpers/enums/auth_page_type.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/auth_viewmodel.dart';

final _signInKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 32.0,
              ),
              Text(
                authViewModel.signinTranslate,
                style: UiConstraints.instance.px24w600k3a4f66,
              ),
              const SizedBox(height: 8.0),
              Text(
                authViewModel.stepperguideTranslate,
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
                  key: _signInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          authViewModel.youremailTranslate,
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
                          hintText: '${authViewModel.emailTranslate}...',
                          hintStyle: UiConstraints.instance.px14w400ka6a6a6,
                          prefixIcon: Icon(Icons.mail, color: UiConstraints.instance.kfe734c),
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          authViewModel.passwordTranslate,
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
                          hintText: '${authViewModel.passwordTranslate}...',
                          hintStyle: UiConstraints.instance.px14w400ka6a6a6,
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
                                  authViewModel.remembermeTranslate,
                                  style: UiConstraints.instance.px12w400kc4c4c4,
                                )
                              ],
                            ),
                            TextButton(
                              onPressed: () => authViewModel.changePage(AuthPageType.forgotpassword),
                              child: Text(
                                authViewModel.forgotpassword2Translate,
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
                        onPressed: () {
                          if (_signInKey.currentState!.validate()) {
                            authViewModel.showSnackBar(content: "Register ok!!");
                          }
                        },
                        child: Text(authViewModel.signinTranslate),
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
                child: Text(authViewModel.signinviafbTranslate),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authViewModel.donthaveaccTranslate,
                    style: UiConstraints.instance.px12w600k3a4f66,
                  ),
                  TextButton(
                    onPressed: () => authViewModel.changePage(AuthPageType.signup),
                    child: Text(
                      authViewModel.signup2Translate,
                      style: UiConstraints.instance.px12w600kfe734c,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
