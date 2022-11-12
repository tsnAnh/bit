abstract class ApiPath {
  static const me = '/me';
  static String publications(String userId) => '/users/$userId/publications';
}
