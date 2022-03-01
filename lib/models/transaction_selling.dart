class TransactionSelling {
  int id;
  String transactionId;
  String productId;
  String variationId;
  int quantity;
  String unitPrice;
  dynamic taxId;
  dynamic discountId;
  DateTime createdAt;
  DateTime updatedAt;

  TransactionSelling({
    required this.id,
    required this.transactionId,
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.unitPrice,
    required this.taxId,
    required this.discountId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionSelling.fromJson(Map<String, dynamic> json) {
    return TransactionSelling(
      id: json["id"],
      transactionId: json["transaction_id"],
      productId: json["product_id"],
      variationId: json["variation_id"],
      quantity: json["quantity"],
      unitPrice: json["unit_price"],
      taxId: json["tax_id"],
      discountId: json["discount_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}
