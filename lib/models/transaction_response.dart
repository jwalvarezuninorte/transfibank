import 'dart:convert';
import 'transaction.dart';

class TransactionResponse {
  TransactionResponse({
    required this.results,
  });

  List<Transaction> results;

  factory TransactionResponse.fromJson(String str) =>
      TransactionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionResponse.fromMap(Map<String, dynamic> json) =>
      TransactionResponse(
        results: List<Transaction>.from(
            json["results"].map((x) => Transaction.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
