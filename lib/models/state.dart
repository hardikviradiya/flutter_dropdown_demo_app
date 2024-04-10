class State {
  final int id;
  final String value;

  State({required this.id, required this.value});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      id: json['id'],
      value: json['value'],
    );
  }
}