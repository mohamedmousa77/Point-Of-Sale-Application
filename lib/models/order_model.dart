class Order {
  int productId;
  int quantity;
  int quantityReturned;
  int unitPriceBeforeDiscount;
  int unitPrice;
  int itemTax;
  String lineDiscountType;
  int discountId;
  int variationId;
  int taxId;

  Order({
    required this.productId,
    required this.quantity,
    required this.quantityReturned,
    required this.unitPriceBeforeDiscount,
    required this.unitPrice,
    required this.itemTax,
    required this.lineDiscountType,
    required this.discountId,
    required this.variationId,
    required this.taxId,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        productId: json["product_id"],
        quantity: json["quantity"],
        quantityReturned: json["quantity_returned"],
        unitPriceBeforeDiscount: json["unit_price_before_discount"],
        unitPrice: json["unit_price"],
        itemTax: json["item_tax"],
        lineDiscountType: json["line_discount_type"],
        discountId: json["discount_id"],
        variationId: json["variation_id"],
        taxId: json["tax_id"],
      );
}
