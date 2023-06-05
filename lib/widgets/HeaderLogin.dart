import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double percentageHeight = screenHeight * 0.3; // 25% da altura da tela

    return SizedBox(
      width: double.infinity,
      height: percentageHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Barbell.png',
                ),
                const SizedBox(width: 12),
                const Text(
                  'Gym+',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            const Text(
                'Treine sua mente e o seu corpo',
                style: TextStyle(
                  color: Color(0xFFE1E1E6),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                )
            )
          ],
        )
      ),
    );
  }
}
