import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/helpers/enums/auth_page_type.dart';
import 'package:food_delivery_app/app/helpers/enums/snackbar_type.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/auth_viewmodel.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';

final _signUpKey = GlobalKey<FormState>();

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
    required this.authViewModel,
  }) : super(key: key);

  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    final phoneMaskFormatter = MaskTextInputFormatter(mask: '+994 (##) ###-##-##');
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 32.0,
              ),
              Text(
                authViewModel.signupTranslate,
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
                  key: _signUpKey,
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
                      const SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          authViewModel.mobileTranslate,
                          style: UiConstraints.instance.px14w600k3a4f66,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        cursorColor: UiConstraints.instance.k3a4f66,
                        inputFormatters: [phoneMaskFormatter],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor: UiConstraints.instance.kf8f8f8,
                          hintText: '+994(55) 555-55-55',
                          hintStyle: UiConstraints.instance.px14w400ka6a6a6,
                          prefixIcon: Icon(Icons.phone, color: UiConstraints.instance.kfe734c),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: UiConstraints.instance.kff2c2b),
                            borderRadius: UiConstraints.instance.borderRadius,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: UiConstraints.instance.kff2c2b),
                            borderRadius: UiConstraints.instance.borderRadius,
                          ),
                          errorStyle: UiConstraints.instance.px12w400kff2c2b,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return authViewModel.phonerequiredTranslate;
                          }

                          if (value.replaceAll(' ', '').length < 17) {
                            return authViewModel.phoneincorrectformatTranslate;
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 28.0),
                        child: Row(
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
                              authViewModel.accepttermsTranslate,
                              style: UiConstraints.instance.px12w400kc4c4c4,
                            )
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
                          if (_signUpKey.currentState!.validate()) {
                            authViewModel.showSnackBar(content: "Register ok!!", type: SnackbarType.success);
                          } else {
                            authViewModel.showSnackBar(content: "Register false!!", type: SnackbarType.error);
                          }
                        },
                        child: Text(authViewModel.signupTranslate),
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
                    authViewModel.haveaccTranslate,
                    style: UiConstraints.instance.px12w600k3a4f66,
                  ),
                  TextButton(
                    onPressed: () => authViewModel.changePage(AuthPageType.signin),
                    child: Text(
                      authViewModel.signin2Translate,
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
