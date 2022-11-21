import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    Key? key,
    required this.color,
    required this.assetName,
    required this.name,
    required this.amount,
  }) : super(key: key);

  final Color color;
  final String assetName;
  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            bottom: 30.0,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color,
                color.withAlpha(200),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        "assets/logo.svg",
                        height: 26,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$ $amount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Usuario',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: -250,
          bottom: 0,
          child: SvgPicture.asset(
            assetName,
            height: 150,
            color: Colors.white.withOpacity(0.06),
          ),
        ),
      ],
    );
  }
}
