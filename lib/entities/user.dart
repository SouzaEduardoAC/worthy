
class User {

  String login = '';
  String name = '';
  String email = '';
  String token = '';
  List<String> roles = [];

  @override
  String toString() {
    return 'User{login: $login, name: $name, email: $email, token: $token, roles: $roles}';
  }

  User.fromJson(Map<String,dynamic> map) :
    login = map["login"],
    name = map["name"],
    email = map["email"],
    token = map["token"],
    roles = _getRoles(map);

  static _getRoles(Map<String, dynamic> map) {
    return map["roles"]?.map<String>((e) => e.toString() ).toList();
  }
}
