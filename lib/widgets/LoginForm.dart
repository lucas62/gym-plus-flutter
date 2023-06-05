import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_plus/auth/auth_manager.dart';
import 'package:gym_plus/widgets/Button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double percentageHeight = screenHeight * 0.5; // 50% da altura da tela

    String email = ''; // Variável para armazenar o valor do campo de e-mail
    String password = ''; // Variável para armazenar o valor do campo de senha

    return SizedBox(
      width: double.infinity,
      height: percentageHeight,
      child: Column(
        children: [
          const Text(
            'Acesse sua conta',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF121214),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00B37E), // Cor da borda quando selecionado
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF75A68), // Cor da borda quando há um erro
                      width: 2.0,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xFF7C7C8A)
                  ),
                  hintStyle: TextStyle(
                      color: Color(0xFF7C7C8A)
                  ),
                  hintText: 'Digite seu e-mail',
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true, // Define o campo de texto como um campo de senha
                style: const TextStyle(
                  color: Colors.white
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF121214),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00B37E), // Cor da borda quando selecionado
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF75A68), // Cor da borda quando há um erro
                      width: 2.0,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xFF7C7C8A),
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xFF7C7C8A),
                  ),
                  hintText: 'Digite sua senha',
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Button(
                onPressed: () {
                  if (kDebugMode) {
                    print('Button login access pressed!');
                  }

                  if (email.isEmpty || password.isEmpty) {
                    // Tratar campos vazios
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Erro de validação'),
                          content: const Text('Por favor, preencha todos os campos.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    AuthManager.login(email, password).then((_) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }).catchError((error) {
                      // Tratar erro de login
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Erro de login'),
                            content: Text('Ocorreu um erro ao fazer login: $error'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                },
                buttonText: 'Acessar',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
