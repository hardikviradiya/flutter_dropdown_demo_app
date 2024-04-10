class Country {
  final int id;
  final String value;

  Country({required this.id, required this.value});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      value: json['value'],
    );
  }

  //To use the class as custom dropdown value
  @override
  String toString() {
    return value;
  }
}
