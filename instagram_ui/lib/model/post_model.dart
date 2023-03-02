class PostModel {
  String? postimage;
  String? description;
  String? likes;
  String? location;
  String? username;
  String? userprofile;
  PostModel(
    this.postimage,
    this.description,
    this.likes,
    this.location,
    this.username,
    this.userprofile,
  );
  factory PostModel.fromMapJson(Map<String, dynamic> mapJson) {
    if (mapJson['postimage'] == 'https://loremflickr.com/640/480/business') {
      return PostModel(
        'https://loremflickr.com/640/480/food',
        mapJson['description'],
        mapJson['likes'],
        mapJson['location'],
        mapJson['username'],
        mapJson['userprofile'],
      );
    } else {
      return PostModel(
        mapJson['postimage'],
        mapJson['description'],
        mapJson['likes'],
        mapJson['location'],
        mapJson['username'],
        mapJson['userprofile'],
      );
    }
  }
}
