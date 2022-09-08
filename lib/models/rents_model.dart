class RentsModel {
  int? id;
  String date;
  String invoiceDate;
  int invoiceid;
  double totalInvoice;
  String customer;
  String salesId;
  String oldSalesId;
  String company;
  double rent;
  double payed;
  double totalPayed;
  RentsModel({
    this.id,
    required this.date,
    required this.invoiceDate,
    required this.invoiceid,
    required this.totalInvoice,
    required this.customer,
    required this.salesId,
    required this.oldSalesId,
    required this.company,
    required this.rent,
    required this.payed,
    required this.totalPayed,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'date': date});
    result.addAll({'invoiceDate': invoiceDate});
    result.addAll({'invoiceid': invoiceid});
    result.addAll({'totalInvoice': totalInvoice});
    result.addAll({'customer': customer});
    result.addAll({'salesId': salesId});
    result.addAll({'oldSalesId': oldSalesId});
    result.addAll({'company': company});
    result.addAll({'rent': rent});
    result.addAll({'payed': payed});
    result.addAll({'totalPayed': totalPayed});

    return result;
  }

  factory RentsModel.fromMap(map) {
    return RentsModel(
      id: map['id']?.toInt(),
      date: map['date'] ?? '',
      invoiceDate: map['invoiceDate'] ?? '',
      invoiceid: map['invoiceid']?.toInt() ?? 0,
      totalInvoice: map['totalInvoice']?.toDouble() ?? 0.0,
      customer: map['customer'] ?? '',
      salesId: map['salesId'] ?? '',
      oldSalesId: map['oldSalesId'] ?? '',
      company: map['company'] ?? '',
      rent: map['rent']?.toDouble() ?? 0.0,
      payed: map['payed']?.toDouble() ?? 0.0,
      totalPayed: map['totalPayed']?.toDouble() ?? 0.0,
    );
  }
}
