class ApplicantModel {
  int id;
  bool accept;
  String company;
  int companyId;
  DateTime dateDetails;
  DateTime deliverDate;
  DateTime receivedDate;
  String date;
  bool delivered;
  bool delivering;
  bool received;
  String from;
  String to;
  List items;
  String salesId;
  ApplicantModel({
    required this.id,
    required this.accept,
    required this.company,
    required this.companyId,
    required this.dateDetails,
    required this.deliverDate,
    required this.receivedDate,
    required this.date,
    required this.delivered,
    required this.delivering,
    required this.received,
    required this.from,
    required this.to,
    required this.items,
    required this.salesId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'accept': accept});
    result.addAll({'company': company});
    result.addAll({'companyId': companyId});
    result.addAll({'dateDetails': dateDetails.millisecondsSinceEpoch});
    result.addAll({'deliverDate': deliverDate.millisecondsSinceEpoch});
    result.addAll({'receivedDate': receivedDate.millisecondsSinceEpoch});
    result.addAll({'date': date});
    result.addAll({'delivered': delivered});
    result.addAll({'delivering': delivering});
    result.addAll({'received': received});
    result.addAll({'from': from});
    result.addAll({'to': to});
    result.addAll({'items': items});
    result.addAll({'salesId': salesId});

    return result;
  }

  factory ApplicantModel.fromMap(map) {
    return ApplicantModel(
      id: map['id']?.toInt() ?? 0,
      accept: map['accept'] ?? false,
      company: map['company'] ?? '',
      companyId: map['companyId']?.toInt() ?? 0,
      dateDetails: map['dateDetails'].toDate(),
      deliverDate: map['deliverDate'].toDate(),
      receivedDate: map['receivedDate'].toDate(),
      date: map['date'] ?? '',
      delivered: map['delivered'] ?? false,
      delivering: map['delivering'] ?? false,
      received: map['received'] ?? false,
      from: map['from'] ?? '',
      to: map['to'] ?? '',
      items: List.from(map['items']),
      salesId: map['salesId'] ?? '',
    );
  }
}
