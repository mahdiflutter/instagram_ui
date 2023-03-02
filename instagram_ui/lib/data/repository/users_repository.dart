import 'package:dartz/dartz.dart';
import 'package:instagram_ui/data/datasource/users_datasource.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/user_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IUsersRepository {
  Future<Either<String, List<UserModel>>> getAllUsers();
}

class UsersRepository implements IUsersRepository {
  final IUsersDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<UserModel>>> getAllUsers() async {
    try {
      var response = await _dataSource.getAllUsers();
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return const Left(
          'SomeThing went Wrong',
        );
      }
    } on ApiException catch (exception) {
      return Left(exception.exceptionMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error!');
    }
  }
}
