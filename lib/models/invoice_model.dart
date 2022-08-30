class Invoice {
  int? id;
  String date;
  String dueDate;
  double total;
  String customerName;
  String salesId;
  String company;
  int uploaded;
  double vat;
  double delivery;
  Invoice({
    this.id,
    required this.date,
    required this.dueDate,
    required this.total,
    required this.customerName,
    required this.salesId,
    required this.company,
    required this.uploaded,
    required this.vat,
    required this.delivery,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'date': date});
    result.addAll({'dueDate': dueDate});
    result.addAll({'total': total});
    result.addAll({'customerName': customerName});
    result.addAll({'salesId': salesId});
    result.addAll({'company': company});
    result.addAll({'uploaded': uploaded});
    result.addAll({'vat': vat});
    result.addAll({'delivery': delivery});

    return result;
  }

  factory Invoice.fromMap(map) {
    return Invoice(
      id: map['id']?.toInt(),
      date: map['date'] ?? '',
      dueDate: map['dueDate'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      customerName: map['customerName'] ?? '',
      salesId: map['salesId'] ?? '',
      company: map['company'] ?? '',
      uploaded: map['uploaded']?.toInt() ?? 0,
      vat: map['vat']?.toDouble() ?? 0.0,
      delivery: map['delivery']?.toDouble() ?? 0.0,
    );
  }
}
