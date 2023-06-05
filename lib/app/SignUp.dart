import 'package:flutter/material.dart';
import 'package:gym_plus/widgets/BackgroundImageLinearGradient.dart';
import 'package:gym_plus/widgets/FooterLogin.dart';
import 'package:gym_plus/widgets/HeaderLogin.dart';
import 'package:gym_plus/widgets/LoginForm.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImageScreen(),
          ListView( // Use ListView para tornar o conteúdo scrollable
            children: const [
              HeaderLogin(),
              LoginForm(),
              FooterLogin(),
            ],
          ),
        ],
      ),
    );
  }
}
