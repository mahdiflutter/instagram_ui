import 'package:dartz/dartz.dart';
import 'package:instagram_ui/data/datasource/posts_datasource.dart';
import 'package:instagram_ui/data/datasource/userposts_datasource.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IUserPostsRepository {
  Future<Either<String, List<ImageModel>>> getAllPosts();
}

class UserPostsRepositpry implements IUserPostsRepository {
  final IUserPostsDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ImageModel>>> getAllPosts() async {
    try {
      var response = await _dataSource.getAllPosts();
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return const Left('something went wrong!');
      }
    } on ApiException catch (exception) {
      return Left(exception.exceptionMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error!');
    }
  }
}
