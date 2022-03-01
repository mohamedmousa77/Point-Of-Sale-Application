class Transaction {
  late final int id;
  late final String businessId;
  late final String type;
  late final String paymentStatus;
  late final String contactId;
  late final String invoiceNo;
  late final DateTime transactionDate;
  late final String totalBeforeTax;
  late final String finalTotal;

  Transaction({
    required this.id,
    required this.businessId,
    required this.type,
    required this.paymentStatus,
    required this.contactId,
    required this.invoiceNo,
    required this.transactionDate,
    required this.totalBeforeTax,
    required this.finalTotal,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json["id"].toString()) ?? 0;
    businessId = json["business_id"].toString();
    type = json["type"].toString() == "null" ? "Cash Payment" : json["type"];
    paymentStatus = json["payment_status"].toString();
    contactId = json["contact_id"].toString();
    invoiceNo = json["invoice_no"].toString();
    transactionDate = DateTime.tryParse(json["transaction_date"].toString()) ??
        DateTime.now();
    totalBeforeTax = json["total_before_tax"].toString();
    finalTotal = json["final_total"].toString();
  }

  @override
  String toString() {
    return '''
     "id": $id,
      "business_id": $businessId,
      "type": $type,
      "payment_status": $paymentStatus,
      "contact_id": $contactId,
      "invoice_no": $invoiceNo,
      "transaction_date": $transactionDate,
      "total_before_tax": $totalBeforeTax,
      "final_total": $finalTotal,
      ''';
  }
}
