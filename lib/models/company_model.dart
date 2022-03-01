class CompanyInfo {
  late String _name;
  late String _phoneNumber;
  late String _address;
  late String _taxNumber;

  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get taxNumber => _taxNumber;

  CompanyInfo(
      {required String name,
      required String phoneNumber,
      required String address,
      required String taxNumber}) {
    _name = name;
    _phoneNumber = phoneNumber;
    _address = address;
    _taxNumber = taxNumber;
  }

  CompanyInfo.fromJSON(Map<String, dynamic> json) {
    _name = json["name"];
    _phoneNumber = json["contact_number"];
    _address = json["address"];
    _taxNumber = json["tax_number"];
  }

  @override
  String toString() {
    return 'CompanyInfo(_name: $_name, _phoneNumber: $_phoneNumber, _address: $_address, _taxNumber: $_taxNumber)';
  }
}
