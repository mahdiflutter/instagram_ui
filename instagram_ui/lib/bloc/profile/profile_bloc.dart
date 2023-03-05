import 'package:bloc/bloc.dart';
import 'package:instagram_ui/bloc/profile/profile_event.dart';
import 'package:instagram_ui/bloc/profile/profile_state.dart';
import 'package:instagram_ui/data/repository/profile_repository.dart';
import 'package:instagram_ui/data/repository/userposts_repository.dart';
import 'package:instagram_ui/di/di.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepository _profileRepository = locator.get();
  final IUserPostsRepository _postsRepository = locator.get();
  ProfileBloc() : super(ProfileInitState()) {
    on<ProfileGetDataEvent>(
      (event, emit) async {
        emit(
          ProfileLodingState(),
        );
        var profileResponse = await _profileRepository.getProfileData();
        var postsResponse = await _postsRepository.getAllPosts();
        emit(
          ProfileSuccessResponseState(profileResponse, postsResponse),
        );
      },
    );
  }
}
