class PhoneModel {
  final String number;
  final String telecom;
  final String mobileMoney;

  PhoneModel({
    required this.number,
    required this.telecom,
    required this.mobileMoney});

  factory PhoneModel.fromMap(Map<String, dynamic> json) {
    return PhoneModel(
      number: json['number'] ?? '',
      telecom: json['telecom'] ?? '',
      mobileMoney: json['mobileMoney'] ?? '',
    );
  }
}