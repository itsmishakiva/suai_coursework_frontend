abstract interface class IAuthService {
  Future<String> auth(String username, String password);

  Future<String> signUp(String username, String password);
}
