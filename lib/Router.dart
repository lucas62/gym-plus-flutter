import 'package:flutter/material.dart';
import 'package:gym_plus/app/DescriptionExercisePage.dart';
import 'package:gym_plus/app/HomePage.dart';
import 'package:gym_plus/app/SignUp.dart';

import 'package:gym_plus/app/login.dart';
import 'package:gym_plus/auth/auth_manager.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          if (AuthManager.isLoggedIn()) {
            return const HomePage();
          } else {
            return const Login();
          }
        });
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case '/home':
        if (AuthManager.isLoggedIn()) {
          return MaterialPageRoute(builder: (_) => const HomePage());
        } else {
          // Redirecionar para a rota de login se o usuário não estiver logado
          return MaterialPageRoute(builder: (_) => const Login());
        }
      case '/home/exercise/description':
        if (AuthManager.isLoggedIn()) {
          final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => DescricaoExercicioPage(
              foto: args['foto'],
              titulo: args['titulo'],
              series: args['series'],
              repeticoes: args['repeticoes'],
            ),
          );
        } else {
          // Redirecionar para a rota de login se o usuário não estiver logado
          return MaterialPageRoute(builder: (_) => const Login());
        }
      default:
        return MaterialPageRoute(builder: (_) {
          if (AuthManager.isLoggedIn()) {
            return const HomePage();
          } else {
            return const Login();
          }
        });
    }
  }
}
