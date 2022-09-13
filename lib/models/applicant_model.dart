class ApplicantModel {
  int id;
  bool accept;
  String company;
  int companyId;
  DateTime dateDetails;
  String date;
  bool delivered;
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
    required this.date,
    required this.delivered,
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
    result.addAll({'date': date});
    result.addAll({'delivered': delivered});
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
      date: map['date'] ?? '',
      delivered: map['delivered'] ?? false,
      from: map['from'] ?? '',
      to: map['to'] ?? '',
      items: List.from(map['items']),
      salesId: map['salesId'] ?? '',
    );
  }
}
