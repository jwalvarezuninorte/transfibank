import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.username,
    required this.type,
    required this.amount,
    required this.date,
  }) : super(key: key);

  final String username;
  final String type;
  final int amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // 'Mayo 26, 2022',
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff2D3548),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${type == "Ingreso" ? "+" : "-"}$amount',
                style: TextStyle(
                  fontSize: 16,
                  color: type == "Ingreso"
                      ? Colors.indigo.shade700
                      : Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                type,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: type == "Ingreso"
                      ? Colors.indigo.shade700
                      : Colors.red.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
