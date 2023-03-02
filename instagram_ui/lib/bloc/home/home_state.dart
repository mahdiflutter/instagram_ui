import 'package:dartz/dartz.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/model/user_model.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessResponseState extends HomeState {
  Either<String, List<UserModel>> storiesResponse;
  Either<String, List<PostModel>> postsResponse;
  HomeSuccessResponseState(
    this.storiesResponse,
    this.postsResponse,
  );
}
