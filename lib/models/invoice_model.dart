class Invoice {
  int? id;
  String date;
  String dueDate;
  double total;
  String customerName;
  int salesId;
  String company;
  Invoice({
    this.id,
    required this.date,
    required this.dueDate,
    required this.total,
    required this.customerName,
    required this.salesId,
    required this.company,
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

    return result;
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id']?.toInt(),
      date: map['date'] ?? '',
      dueDate: map['dueDate'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      customerName: map['customerName'] ?? '',
      salesId: map['salesId']?.toInt() ?? 0,
      company: map['company'] ?? '',
    );
  }
}
