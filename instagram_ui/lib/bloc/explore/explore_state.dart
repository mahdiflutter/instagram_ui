import 'package:dartz/dartz.dart';
import 'package:instagram_ui/model/image_model.dart';

abstract class ExploreState {}

class ExploreInitState extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreSuccessResponseState extends ExploreState {
  Either<String, List<ImageModel>>? exploreResponse;
  ExploreSuccessResponseState(this.exploreResponse);
}
