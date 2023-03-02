import 'package:dio/dio.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/user_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IUsersDataSource {
  Future<List<UserModel>> getAllUsers();
}

class UsersDataSource implements IUsersDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      var response = await _dio.get('/users');
      return response.data
          .map<UserModel>(
            (mapJson) => UserModel.fromMapJson(mapJson),
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
