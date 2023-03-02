import 'package:dio/dio.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IPostsDataSource {
  Future<List<PostModel>> getAllPosts();
}

class PostsDataSource implements IPostsDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      var response = await _dio.get('/posts');
      return response.data
          .map<PostModel>(
            (mapJson) => PostModel.fromMapJson(mapJson),
          )
          .toList();
    } on DioError catch (exception) {
      throw ApiException(
        exception.response!.statusCode,
        exception.response!.statusMessage,
      );
    } catch (anotherException) {
      throw ApiException(
        0,
        'Uknown Error!',
      );
    }
  }
}
