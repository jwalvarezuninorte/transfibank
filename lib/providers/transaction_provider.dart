import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transfibank/models/transaction_response.dart';

import '../constants/constants.dart';
import '../models/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  final _baseUrl = Constants.baseUrl;

  List<Transaction> transactions = [];

  TransactionProvider() {
    print("TransactionProvider Inicializado");
    getTransactions(1);
  }

  getTransactions(int productId) async {
    var url = Uri.http(
      _baseUrl,
      'transactions',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final transactionResponse = TransactionResponse.fromJson(
        '{"results": ${response.body}}',
      );
      transactions = transactionResponse.results;
      print(transactions);
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }
}
