import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonText({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            const Color(0xFF00B37E).withOpacity(0.2), // Cor de efeito ao clicar no botão
          ),
        ),
        child: Text(
            buttonText,
            style: const TextStyle(
              color: Color(0xFFE1E1E6),
              fontWeight: FontWeight.normal,
              fontSize: 16,
            )
        )
    );
  }
}
