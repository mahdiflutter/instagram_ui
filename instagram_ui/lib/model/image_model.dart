class ImageModel {
  String? imageUrl;
  ImageModel(this.imageUrl);
  factory ImageModel.fromMapJson(Map<String, dynamic> mapJson) {
    if (mapJson['postimage'] == 'https://loremflickr.com/640/480/business') {
      return ImageModel(
        'https://loremflickr.com/640/480/food',
      );
    } else {
      return ImageModel(
        mapJson['postimage'],
      );
    }
  }
}
