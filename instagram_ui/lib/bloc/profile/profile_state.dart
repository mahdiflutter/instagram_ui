import 'package:dartz/dartz.dart';
import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/model/profile_model.dart';

class ProfileState {}

class ProfileInitState extends ProfileState {}

class ProfileLodingState extends ProfileState {}

class ProfileSuccessResponseState extends ProfileState {
  Either<String, ProfileModel>? profileInformation;
  Either<String, List<ImageModel>>? userPosts;
  ProfileSuccessResponseState(this.profileInformation,this.userPosts);
}
