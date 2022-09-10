class ReturnModel {
  int? id;
  String date;
  String customer;
  String salesId;
  String company;
  double total;
  double vat;
  int uploaded;
  ReturnModel({
    this.id,
    required this.date,
    required this.customer,
    required this.salesId,
    required this.company,
    required this.total,
    required this.vat,
    required this.uploaded,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'date': date});
    result.addAll({'customer': customer});
    result.addAll({'salesId': salesId});
    result.addAll({'company': company});
    result.addAll({'total': total});
    result.addAll({'vat': vat});
    result.addAll({'uploaded': uploaded});

    return result;
  }

  factory ReturnModel.fromMap(map) {
    return ReturnModel(
      id: map['id']?.toInt(),
      date: map['date'] ?? '',
      customer: map['customer'] ?? '',
      salesId: map['salesId'] ?? '',
      company: map['company'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      vat: map['vat']?.toDouble() ?? 0.0,
      uploaded: map['uploaded']?.toInt() ?? 0,
    );
  }
}
