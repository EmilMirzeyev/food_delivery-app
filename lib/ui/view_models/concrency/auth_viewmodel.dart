import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/app/helpers/enums/auth_page_type.dart';
import 'package:food_delivery_app/ui/utils/constraints/key_constraints.dart';

import '/ui/view_models/abstraction/i_base_viewmodel.dart';

class AuthViewModel extends BaseViewModel {
  bool obscure = true;
  bool rememberme = false;
  final String trueEmail = "iam.emilmirza@gmail.com";
  final String truePassword = "12345678";
  AuthPageType authPageType = AuthPageType.signin;

  ///***************** TRANSLATE *********************
  late String _signinTranslate;
  late String _signupTranslate;
  late String _forgotPasswordTranslate;
  late String _stepperguideTranslate;
  late String _forgotpasswordguideTranslate;
  late String _youremailTranslate;
  late String _emailTranslate;
  late String _passwordTranslate;
  late String _remembermeTranslate;
  late String _forgotpassword2Translate;
  late String _signinviafbTranslate;
  late String _donthaveaccTranslate;
  late String _signup2Translate;
  late String _mobileTranslate;
  late String _accepttermsTranslate;
  late String _phonerequiredTranslate;
  late String _phoneincorrectformatTranslate;
  late String _sendnowTranslate;
  late String _backTranslate;
  late String _havingproblemTranslate;
  late String _needhelpTranslate;
  late String _haveaccTranslate;
  late String _signin2Translate;
  late String _emailrequiredTranslate;
  late String _emailincorrectformatTranslate;

  String get signinTranslate => _signinTranslate;
  String get signupTranslate => _signupTranslate;
  String get forgotPasswordTranslate => _forgotPasswordTranslate;
  String get stepperguideTranslate => _stepperguideTranslate;
  String get forgotpasswordguideTranslate => _forgotpasswordguideTranslate;
  String get youremailTranslate => _youremailTranslate;
  String get emailTranslate => _emailTranslate;
  String get passwordTranslate => _passwordTranslate;
  String get remembermeTranslate => _remembermeTranslate;
  String get forgotpassword2Translate => _forgotpassword2Translate;
  String get signinviafbTranslate => _signinviafbTranslate;
  String get donthaveaccTranslate => _donthaveaccTranslate;
  String get signup2Translate => _signup2Translate;
  String get mobileTranslate => _mobileTranslate;
  String get accepttermsTranslate => _accepttermsTranslate;
  String get phonerequiredTranslate => _phonerequiredTranslate;
  String get phoneincorrectformatTranslate => _phoneincorrectformatTranslate;
  String get sendnowTranslate => _sendnowTranslate;
  String get backTranslate => _backTranslate;
  String get havingproblemTranslate => _havingproblemTranslate;
  String get needhelpTranslate => _needhelpTranslate;
  String get haveaccTranslate => _haveaccTranslate;
  String get signin2Translate => _signin2Translate;
  String get emailrequiredTranslate => _emailrequiredTranslate;
  String get emailincorrectformatTranslate => _emailincorrectformatTranslate;

  ///***************** TRANSLATE ENDS ****************

  void changeObscure() {
    obscure = !obscure;
    tryUpdateUi();
  }

  void changeRememberme() {
    rememberme = !rememberme;
    tryUpdateUi();
  }

  void changePage(AuthPageType type) {
    authPageType = type;
    tryUpdateUi();
  }

  @override
  void initialize() {
    _signinTranslate = localizator.getWord(key: keys[WordMapKeys.signin]!);
    _signupTranslate = localizator.getWord(key: keys[WordMapKeys.signup]!);
    _forgotPasswordTranslate = localizator.getWord(key: keys[WordMapKeys.forgotpassword]!);
    _stepperguideTranslate = localizator.getWord(key: keys[WordMapKeys.stepperguide]!);
    _forgotpasswordguideTranslate = localizator.getWord(key: keys[WordMapKeys.forgotpasswordguide]!);
    _youremailTranslate = localizator.getWord(key: keys[WordMapKeys.youremail]!);
    _emailTranslate = localizator.getWord(key: keys[WordMapKeys.email]!);
    _passwordTranslate = localizator.getWord(key: keys[WordMapKeys.password]!);
    _remembermeTranslate = localizator.getWord(key: keys[WordMapKeys.rememberme]!);
    _forgotpassword2Translate = localizator.getWord(key: keys[WordMapKeys.forgotpassword2]!);
    _signinviafbTranslate = localizator.getWord(key: keys[WordMapKeys.signinviafb]!);
    _donthaveaccTranslate = localizator.getWord(key: keys[WordMapKeys.donthaveacc]!);
    _signup2Translate = localizator.getWord(key: keys[WordMapKeys.signup2]!);
    _mobileTranslate = localizator.getWord(key: keys[WordMapKeys.mobile]!);
    _accepttermsTranslate = localizator.getWord(key: keys[WordMapKeys.acceptterms]!);
    _phonerequiredTranslate = localizator.getWord(key: keys[WordMapKeys.phonerequired]!);
    _phoneincorrectformatTranslate = localizator.getWord(key: keys[WordMapKeys.phoneincorrectformat]!);
    _sendnowTranslate = localizator.getWord(key: keys[WordMapKeys.sendnow]!);
    _backTranslate = localizator.getWord(key: keys[WordMapKeys.back]!);
    _havingproblemTranslate = localizator.getWord(key: keys[WordMapKeys.havingproblem]!);
    _needhelpTranslate = localizator.getWord(key: keys[WordMapKeys.needhelp]!);
    _haveaccTranslate = localizator.getWord(key: keys[WordMapKeys.haveacc]!);
    _signin2Translate = localizator.getWord(key: keys[WordMapKeys.signin2]!);
    _emailrequiredTranslate = localizator.getWord(key: keys[WordMapKeys.emailrequired]!);
    _emailincorrectformatTranslate = localizator.getWord(key: keys[WordMapKeys.emailincorrectformat]!);
  }

  AuthViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
