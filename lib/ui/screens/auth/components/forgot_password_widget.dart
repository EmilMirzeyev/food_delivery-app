import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/helpers/enums/auth_page_type.dart';
import 'package:food_delivery_app/app/helpers/enums/snackbar_type.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/auth_viewmodel.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';

final _forgotPasswordKey = GlobalKey<FormState>();

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    Key? key,
    required this.authViewModel,
  }) : super(key: key);

  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    const String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
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
                authViewModel.forgotPasswordTranslate,
                style: UiConstraints.instance.px24w600k3a4f66,
              ),
              const SizedBox(height: 8.0),
              Text(
                authViewModel.forgotpasswordguideTranslate,
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
                  key: _forgotPasswordKey,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return authViewModel.emailrequiredTranslate;
                          }

                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return authViewModel.emailincorrectformatTranslate;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 32.0,
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
                          if (_forgotPasswordKey.currentState!.validate()) {
                            authViewModel.showSnackBar(content: "Register ok!!", type: SnackbarType.success);
                          }
                        },
                        child: Text(
                          authViewModel.sendnowTranslate,
                          style: UiConstraints.instance.px14w600kffffff,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      OutlinedButton(
                          onPressed: () => authViewModel.changePage(AuthPageType.signin),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            side: BorderSide(color: UiConstraints.instance.kfe734c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            authViewModel.backTranslate,
                            style: UiConstraints.instance.px14w600kfe734c,
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authViewModel.havingproblemTranslate,
                    style: UiConstraints.instance.px12w600k3a4f66,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      authViewModel.needhelpTranslate,
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
