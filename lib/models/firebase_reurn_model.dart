class FirebaseReturnModel {
  int id;
  String date;
  String customer;
  String salesId;
  String company;
  double total;
  double vat;
  int uploaded;
  List items;
  FirebaseReturnModel({
    required this.id,
    required this.date,
    required this.customer,
    required this.salesId,
    required this.company,
    required this.total,
    required this.vat,
    required this.uploaded,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'date': date});
    result.addAll({'customer': customer});
    result.addAll({'salesId': salesId});
    result.addAll({'company': company});
    result.addAll({'total': total});
    result.addAll({'vat': vat});
    result.addAll({'uploaded': uploaded});
    result.addAll({'items': items});

    return result;
  }

  factory FirebaseReturnModel.fromMap(map) {
    return FirebaseReturnModel(
      id: map['id']?.toInt() ?? 0,
      date: map['date'] ?? '',
      customer: map['customer'] ?? '',
      salesId: map['salesId'] ?? '',
      company: map['company'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      vat: map['vat']?.toDouble() ?? 0.0,
      uploaded: map['uploaded']?.toInt() ?? 0,
      items: List.from(map['items']),
    );
  }
}
