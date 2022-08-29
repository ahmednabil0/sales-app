class ItemModel {
  int companyId;
  String companyName;
  int id;
  String name;
  double price;
  String unit;
  String url;
  double vat;
  int quntity;
  ItemModel({
    required this.companyId,
    required this.companyName,
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
    required this.url,
    required this.vat,
    required this.quntity,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'companyId': companyId});
    result.addAll({'companyName': companyName});
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'unit': unit});
    result.addAll({'url': url});
    result.addAll({'vat': vat});
    result.addAll({'quntity': quntity});

    return result;
  }

  factory ItemModel.fromMap(map) {
    return ItemModel(
      companyId: map['companyId']?.toInt() ?? 0,
      companyName: map['companyName'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      unit: map['unit'] ?? '',
      url: map['url'] ?? '',
      vat: map['vat']?.toDouble() ?? 0.0,
      quntity: map['quntity']?.toInt() ?? 0,
    );
  }
}
