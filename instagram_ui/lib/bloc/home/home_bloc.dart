import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/bloc/home/home_event.dart';
import 'package:instagram_ui/bloc/home/home_state.dart';
import 'package:instagram_ui/data/repository/posts_repository.dart';
import 'package:instagram_ui/data/repository/users_repository.dart';
import 'package:instagram_ui/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IUsersRepository _usersRepository = locator.get();
  final IPostsRepository _postsRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetDataEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var stories = await _usersRepository.getAllUsers();
        var posts = await _postsRepository.getAllPosts();
        emit(
          HomeSuccessResponseState(stories, posts),
        );
      },
    );
  }
}
