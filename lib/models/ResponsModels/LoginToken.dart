/// token : "24|UFNgpqxMYa50Hn6evY40ndxnXkzEgACvGr5Ac9cK"

class LoginToken {
  LoginToken({
    String? token,
  }) {
    _token = token;
  }

  LoginToken.fromJson(dynamic json) {
    _token = json['token'];
  }

  String? _token;

  LoginToken copyWith({
    String? token,
  }) =>
      LoginToken(
        token: token ?? _token,
      );

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
