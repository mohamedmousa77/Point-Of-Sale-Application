class LinksUrl {
  static const String _domainName = "https://pos.our2030vision.com";
  static const String _typeFormat = "application/json";
  static const String _pathUrl = "/api";

  static const String _productUrl = _domainName + _pathUrl + "/product";
  static const String _productPriceUrl = _productUrl + "/variation/";

  static const String _busnissUrl =
      _domainName + _pathUrl + "/business/location";
  static const String _categoryUrl = _domainName + _pathUrl + "/category";

  static const String _customerUrl = _domainName + _pathUrl + "/customer/";
  static const String _addCustomerUrl = _domainName + _pathUrl + "/customer";
  static const String _customerSearchById = _customerUrl + "id/";

  static const String _transactionUrl = _domainName + _pathUrl + "/transaction";
  static const String _transactionSearchByTransactionId =
      _domainName + _pathUrl + "/transaction/sell/";
  static const String _transactionSellingUrl =
      _domainName + _pathUrl + "/transaction/sells";

  static const String _userLoginUrl = _domainName + _pathUrl + "/login";
  static const String _userLogoutUrl = _domainName + _pathUrl + "/logout";
  static const String _resetPassword = _domainName + _pathUrl + "/user/1";

  String get productUrl => _productUrl;
  String get formatName => _typeFormat;
  String get busnissUrl => _busnissUrl;
  String get categoryUrl => _categoryUrl;
  String get customerUrl => _customerUrl;

  String get addCustomerUrl => _addCustomerUrl;
  String get transactionUrl => _transactionUrl;
  String get transactionSellingUrl => _transactionSellingUrl;
  String get userLoginUrl => _userLoginUrl;
  String get userLogoutUrl => _userLogoutUrl;
  String get resetPassword => _resetPassword;
  String get customerSearchById => _customerSearchById;
  String get transactionSearchByTransactionId =>
      _transactionSearchByTransactionId;
  String get productPriceUrl => _productPriceUrl;
}
