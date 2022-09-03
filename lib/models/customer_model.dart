// ignore_for_file: non_constant_identifier_names

class CustomerModel {
  String cid;
  int companyId;
  String companyName;
  String custName;
  String phone;
  int rent;
  double rent_value;
  CustomerModel({
    required this.cid,
    required this.companyId,
    required this.companyName,
    required this.custName,
    required this.phone,
    required this.rent,
    required this.rent_value,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cid': cid});
    result.addAll({'companyId': companyId});
    result.addAll({'companyName': companyName});
    result.addAll({'custName': custName});
    result.addAll({'phone': phone});
    result.addAll({'rent': rent});
    result.addAll({'rent_value': rent_value});

    return result;
  }

  factory CustomerModel.fromMap(map) {
    return CustomerModel(
      cid: map['cid'] ?? '',
      companyId: map['companyId']?.toInt() ?? 0,
      companyName: map['companyName'] ?? '',
      custName: map['custName'] ?? '',
      phone: map['phone'] ?? '',
      rent: map['rent']?.toInt() ?? 0,
      rent_value: map['rent_value']?.toDouble() ?? 0.0,
    );
  }
}
