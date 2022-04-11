class UiMedia {
  static UiMedia get instance => _instance ??= UiMedia._();
  static UiMedia? _instance;
  UiMedia._();
  //IMAGES
  String get wishlistEmptyPath => 'assets/images/wishlist_empty.png';
  String get basketEmptyPath => 'assets/images/empty_basket.png';
  String get profilePath => 'assets/images/profile.jpg';

  //VECTORS
  String get xPath => 'assets/vectors/x.svg';
  String get infoCircleOutlinedPath => 'assets/vectors/info_circle_outlined.svg';
  String get checkPath => 'assets/vectors/check.svg';
  String get companyPath => 'assets/vectors/company.svg';
  String get trashPath => 'assets/vectors/trash.svg';
  String get minusPath => 'assets/vectors/minus.svg';
  String get plusPath => 'assets/vectors/plus.svg';
}
