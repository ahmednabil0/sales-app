class BranshModel {
  String bransh;
  String companyName;
  int companyId;
  int branshId;
  BranshModel({
    required this.bransh,
    required this.companyName,
    required this.companyId,
    required this.branshId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bransh': bransh});
    result.addAll({'companyName': companyName});
    result.addAll({'companyId': companyId});
    result.addAll({'branshId': branshId});

    return result;
  }

  factory BranshModel.fromMap(map) {
    return BranshModel(
      bransh: map['bransh'] ?? '',
      companyName: map['companyName'] ?? '',
      companyId: map['companyId']?.toInt() ?? 0,
      branshId: map['branshId']?.toInt() ?? 0,
    );
  }
}
