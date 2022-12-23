class Users {
  int id;
  String username;
  String name;
  String state;
  String avatarUrl;

  Users(
      {required this.id,
      required this.username,
      required this.name,
      required this.state,
      required this.avatarUrl});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ?? "",
      name: json['name'] as String? ?? "",
      state: json['state'] as String? ?? "",
      avatarUrl: json['avatar_url'] as String? ?? "",
    );
  }
}
