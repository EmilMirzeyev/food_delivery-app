import 'package:flutter/painting.dart';

class UiConstraints {
  static UiConstraints get instance => _instance ??= UiConstraints._();
  static UiConstraints? _instance;
  UiConstraints._();
  BorderRadius get borderRadius => BorderRadius.circular(6.0);

  //COLOR
  Color get k3a4f66 => const Color(0xff3a4f66);
  Color get kff2c2b => const Color(0xffff2c2b);
  Color get k4167b0 => const Color(0xff4167b0);
  Color get kfe734c => const Color(0xfffe734c);
  Color get kfff => const Color(0xffffffff);
  Color get kccddff => const Color(0xffccddff);
  Color get kf8f8f8 => const Color(0xfff8f8f8);
  Color get kc4c4c4 => const Color(0xffc4c4c4);
  Color get k171718 => const Color(0xff171718);
  Color get k150_187_124 => const Color.fromRGBO(150, 187, 124, 1);

  //TEXTSTYLES
  TextStyle get px24w600k171718 => const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff171718));
  TextStyle get px24w600k3a4f66 => const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff3a4f66));
  TextStyle get px12w400kc4c4c4 => const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffc4c4c4));
  TextStyle get px14w400kc4c4c4 => const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffc4c4c4));
  TextStyle get px12w600k3a4f66 => const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff3a4f66));
  TextStyle get px12w600kfe734c => const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xfffe734c));
  TextStyle get px12w400kff2c2b => const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffff2c2b));
  TextStyle get px14w600k3a4f66 => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff3a4f66));
  TextStyle get px14w600kffffff => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffffffff));
  TextStyle get px14w600kfe734c => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xfffe734c));
  TextStyle get px14w400ka6a6a6 => const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffa6a6a6));
  TextStyle get px12w400k171718 => const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff171718));
  TextStyle get px13w500k171718 => const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff171718));
}
