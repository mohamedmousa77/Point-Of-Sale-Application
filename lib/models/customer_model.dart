class Customer {
  var businessId;
  String type;
  String supplierBusinessName;
  String name;
  String firstName;
  String middleName;
  String mobile;
  int id;

  Customer({
    required this.businessId,
    required this.type,
    required this.supplierBusinessName,
    required this.name,
    required this.firstName,
    required this.middleName,
    required this.mobile,
    required this.id,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        businessId: json["business_id"],
        type: json["type"],
        supplierBusinessName: json["supplier_business_name"],
        name: json["name"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        mobile: json["mobile"],
        id: json["id"],
      );
}
