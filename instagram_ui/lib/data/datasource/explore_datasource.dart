import 'package:dio/dio.dart';
import 'package:instagram_ui/di/di.dart';
import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IExploreDataSource {
  Future<List<ImageModel>> getAllExplore();
}

class ExploreDataSource implements IExploreDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ImageModel>> getAllExplore() async {
    try {
      var response = await _dio.get('/posts');

      var result = response.data
          .map<ImageModel>(
            (mapJson) => ImageModel.fromMapJson(mapJson),
          )
          .toList();
      print(result[0]);
      return result;
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
