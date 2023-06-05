import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_plus/widgets/ButtonOutlined.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double percentageHeight = screenHeight * 0.2; // 25% da altura da tela


    return SizedBox(
      width: double.infinity,
      height: percentageHeight,
      child:  Column(
        children: [
          const Text(
              'Ainda não tem acesso?',
              style: TextStyle(
                color: Color(0xFFE1E1E6),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              )
          ),
          const SizedBox(height: 14,),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0), // Padding horizontal de 20 e margem inferior de 32
              child: ButtonOutlined(
                onPressed: () {
                  // Função a ser executada quando o botão for pressionado
                  print('Botão pressionado');
                },
                buttonText: 'Criar conta',
              ),
            ),
          )
        ],
      )
    );
  }
}
