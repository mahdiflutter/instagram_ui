class UserModel {
  String? username;
  String? avatar;
  String? bio;
  String? followers;
  String? following;
  UserModel(
    this.username,
    this.avatar,
    this.bio,
    this.followers,
    this.following,
  );
  factory UserModel.fromMapJson(Map<String, dynamic> mapJson) {
    return UserModel(
      mapJson['username'],
      mapJson['avatar'],
      mapJson['bio'],
      mapJson['followers'],
      mapJson['following'],
    );
  }
}
