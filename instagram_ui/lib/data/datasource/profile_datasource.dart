import 'package:dartz/dartz.dart';
import 'package:instagram_ui/model/profile_model.dart';
import 'package:instagram_ui/util/api_exception.dart';

abstract class IProfileDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileDataSource implements IProfileDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    try {
      var response = await ProfileModel(
        'mahdi_flutter',
        'https://blog.logrocket.com/wp-content/uploads/2021/08/handling-local-data-persistence-flutter-hive.png',
        'i am a flutter developer. i love my job♥',
        6,
        560,
        10,
      );
      return response;
    } catch (exception) {
      throw ApiException(
        0,
        'Something went wrong!',
      );
    }
  }
}
