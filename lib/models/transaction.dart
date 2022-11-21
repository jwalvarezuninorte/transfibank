import 'dart:convert';

class Transaction {
  Transaction({
    required this.id,
    required this.username,
    required this.type,
    required this.date,
    required this.amount,
  });

  String id;
  String username;
  String type;
  String date;
  double amount;

  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        username: json["username"],
        type: json["type"],
        date: json["date"],
        amount: json["amount"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "type": type,
        "date": date,
        "amount": amount,
      };
}
