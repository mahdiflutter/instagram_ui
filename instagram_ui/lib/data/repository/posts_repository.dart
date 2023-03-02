import 'package:dartz/dartz.dart';
import 'package:instagram_ui/data/datasource/posts_datasource.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IPostsRepository {
  Future<Either<String, List<PostModel>>> getAllPosts();
}

class PostRepository implements IPostsRepository {
  final IPostsDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<PostModel>>> getAllPosts() async {
    try {
      var response = await _dataSource.getAllPosts();
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return const Left('Something went wrong');
      }
    } on ApiException catch (exception) {
      return Left(exception.exceptionMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error!');
    }
  }
}
