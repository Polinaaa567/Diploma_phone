import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color.fromARGB(84, 222, 248, 251),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[Colors.blue, Colors.lightBlueAccent],
                  tileMode: TileMode.mirror,
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.trophy,
                    color: Colors.white,
                  ),
                  Text(
                    "Мои достижения",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
