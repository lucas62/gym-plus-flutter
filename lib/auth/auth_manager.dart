class AuthManager {
  static bool isAuthenticated = false;

  static Future<void> login(String username, String password) async {
    // Lógica de autenticação aqui
    // Verificar se o usuário é válido e fazer login
    isAuthenticated = true;
  }

  static void logout() {
    // Lógica de logout aqui
    // Deslogar o usuário
    isAuthenticated = false;
  }

  static bool isLoggedIn() {
    // Verificar se o usuário está logado
    return isAuthenticated;
  }
}
