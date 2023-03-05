import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IUserPostsDataSource {
  Future<List<ImageModel>> getAllPosts();
}

class UserPostsDataSource implements IUserPostsDataSource {
  @override
  Future<List<ImageModel>> getAllPosts() async {
    try {
      var response = <ImageModel>[
        ImageModel(
            "https://blog.faradars.org/wp-content/uploads/2020/12/What-is-Flutter-in-simple-words.jpg"),
        ImageModel(
            "https://blog.faradars.org/wp-content/uploads/2020/12/Flutter-used-for.jpg"),
        ImageModel("https://avasam.ir/assets/img/avatars/5cc0ac86ab152.png"),
        ImageModel(
            "https://blog.faradars.org/wp-content/uploads/2022/10/kotlin-introduction-main-picture.jpg"),
        ImageModel(
            "https://mihanblockchain.com/wp-content/uploads/2020/07/introducing-the-kotlin-programming-language.jpg"),
        ImageModel(
            "https://files.virgool.io/upload/users/12142/posts/gltk4eh7oms7/ba8muy2k2cks.jpeg"),
      ];
      return response;
    } catch (exception) {
      throw ApiException(
        0,
        'something went wrong!',
      );
    }
  }
}
