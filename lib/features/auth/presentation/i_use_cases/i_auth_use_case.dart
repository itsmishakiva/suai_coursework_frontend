abstract interface class IAuthUseCase {
  //String? param is error message
  Future<String?> auth(String username, String password);

  Future<String?> signup(String username, String password, String repeatPassword);
}