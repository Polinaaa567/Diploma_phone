import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomPercentIndicator extends StatelessWidget {
  final double formula;
  final String textPercent;

  const CustomPercentIndicator({
    super.key,
    required this.formula,
    required this.textPercent,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 28,
      percent: formula,
      backgroundColor: Color.fromARGB(50, 0, 0, 0),
      progressColor: Colors.lightBlueAccent,
      center: Text(
        textPercent,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      barRadius: Radius.circular(15),
    );
  }
}
