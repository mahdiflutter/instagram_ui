import 'package:dartz/dartz.dart';
import 'package:instagram_ui/data/datasource/profile_datasource.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/profile_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IProfileRepository {
  Future<Either<String, ProfileModel>> getProfileData();
}

class ProfileRepository implements IProfileRepository {
  final IProfileDataSource _dataSource = locator.get();
  @override
  Future<Either<String, ProfileModel>> getProfileData() async {
    try {
      var response = await _dataSource.getProfile();
      if (response.userName!.isNotEmpty) {
        return Right(response);
      } else {
        return const Left('Something Went wrong!try again.');
      }
    } on ApiException catch (exception) {
      return Left(exception.exceptionMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error!');
    }
  }
}
