class ItemSqlmodel {
  int? id;
  int invoiceId;
  int itemId;
  String name;
  double price;
  String unit;
  int quntity;
  ItemSqlmodel({
    this.id,
    required this.invoiceId,
    required this.itemId,
    required this.name,
    required this.price,
    required this.unit,
    required this.quntity,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'invoiceId': invoiceId});
    result.addAll({'itemId': itemId});
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'unit': unit});
    result.addAll({'quntity': quntity});

    return result;
  }

  factory ItemSqlmodel.fromMap(map) {
    return ItemSqlmodel(
      id: map['id']?.toInt(),
      invoiceId: map['invoiceId']?.toInt() ?? 0,
      itemId: map['itemId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      unit: map['unit'] ?? '',
      quntity: map['quntity']?.toInt() ?? 0,
    );
  }
}
