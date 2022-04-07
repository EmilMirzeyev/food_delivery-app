class KeyConstraints {
  static KeyConstraints get instance => _instance ??= KeyConstraints._();
  static KeyConstraints? _instance;
  KeyConstraints._();
  Map<WordMapKeys, String> get wordKeys => {
    WordMapKeys.hello: 'hello',
    WordMapKeys.order: 'order',
  };
}

enum WordMapKeys {
  hello,
  order
}
