class FirebaseProduct {
  String id;
  String name;
  String productDescription;
  String barcodeType;
  String alertQuantity;
  String image;
  String gategory;
  String brand;
  String price;

  FirebaseProduct({
    required this.id,
    required this.price,
    required this.name,
    required this.productDescription,
    required this.barcodeType,
    required this.alertQuantity,
    required this.image,
    required this.gategory,
    required this.brand,
  });
}