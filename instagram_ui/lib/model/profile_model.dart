class ProfileModel {
  String? userName;
  String? userProfileUrl;
  String? userBio;
  int? userPosts;
  int? userFollowers;
  int? userFollowing;
  ProfileModel(
    this.userName,
    this.userProfileUrl,
    this.userBio,
    this.userPosts,
    this.userFollowers,
    this.userFollowing,
  );
  factory ProfileModel.fromMapJson(Map<String, dynamic> mapJson) {
    return ProfileModel(
      mapJson['userName'],
      mapJson['userProfileUrl'],
      mapJson['userBio'],
      mapJson['userPosts'],
      mapJson['userFollowers'],
      mapJson['userFollowing'],
    );
  }
}
