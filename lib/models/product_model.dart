class Product {
  int id;
  String name;
  String productDescription;
  String barcodeType;
  String alertQuantity;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.productDescription,
    required this.barcodeType,
    required this.alertQuantity,
    required this.image,
  });

//parsing data
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        productDescription:
            json["product_description"] ?? "No Description For this Item",
        barcodeType: json["barcode_type"],
        alertQuantity: json["alert_quantity"] ?? "Null",
        image: json["image"],
      );
}
