import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_ui/data/datasource/explore_datasource.dart';
import 'package:instagram_ui/data/datasource/posts_datasource.dart';
import 'package:instagram_ui/data/datasource/profile_datasource.dart';
import 'package:instagram_ui/data/datasource/userposts_datasource.dart';
import 'package:instagram_ui/data/datasource/users_datasource.dart';
import 'package:instagram_ui/data/repository/explore_repository.dart';
import 'package:instagram_ui/data/repository/posts_repository.dart';
import 'package:instagram_ui/data/repository/profile_repository.dart';
import 'package:instagram_ui/data/repository/userposts_repository.dart';
import 'package:instagram_ui/data/repository/users_repository.dart';

var locator = GetIt.instance;
Future<void> initioalGetIt() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
          baseUrl: 'https://6400512f63e89b0913abfc6c.mockapi.io/api/v1'),
    ),
  );
  //data sources
  locator.registerFactory<IUsersDataSource>(
    () => UsersDataSource(),
  );
  locator.registerFactory<IPostsDataSource>(
    () => PostsDataSource(),
  );
  locator.registerFactory<IExploreDataSource>(
    () => ExploreDataSource(),
  );
  locator.registerFactory<IProfileDataSource>(
    () => ProfileDataSource(),
  );
  locator.registerFactory<IUserPostsDataSource>(
    () => UserPostsDataSource(),
  );

  //repository
  locator.registerFactory<IUsersRepository>(
    () => UsersRepository(),
  );
  locator.registerFactory<IPostsRepository>(
    () => PostRepository(),
  );
  locator.registerFactory<IExploreRepository>(
    () => ExploreRepository(),
  );
  locator.registerFactory<IProfileRepository>(
    () => ProfileRepository(),
  );
  locator.registerFactory<IUserPostsRepository>(
    () => UserPostsRepositpry(),
  );
}
