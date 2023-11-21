abstract interface class IAuthRepository {
  Future<void> auth(String username, String password);

  Future<void> signup(String username, String password);
}