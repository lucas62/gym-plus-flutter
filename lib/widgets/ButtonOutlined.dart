import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonOutlined({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        shadowColor: MaterialStateProperty.all<Color>(Colors.white),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            width: 1.5,
            color: Color(0xFF00B37E), // Cor da borda
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          const Color(0xFF00B37E).withOpacity(0.2), // Cor de efeito ao clicar no botão
        ),
      ),
      child: Text(
       buttonText,
        style: const TextStyle(
          color: Color(0xFF00B37E),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
