import 'package:dartz/dartz.dart';
import 'package:instagram_ui/data/datasource/explore_datasource.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IExploreRepository {
  Future<Either<String, List<ImageModel>>> getAllExplore();
}

class ExploreRepository implements IExploreRepository {
  final IExploreDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ImageModel>>> getAllExplore() async {
    try {
      var response = await _dataSource.getAllExplore();
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
