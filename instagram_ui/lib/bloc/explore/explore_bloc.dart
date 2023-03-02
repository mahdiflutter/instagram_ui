import 'package:bloc/bloc.dart';
import 'package:instagram_ui/bloc/explore/explore_event.dart';
import 'package:instagram_ui/bloc/explore/explore_state.dart';
import 'package:instagram_ui/data/repository/explore_repository.dart';
import 'package:instagram_ui/di/di.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final IExploreRepository _repository = locator.get();
  ExploreBloc() : super(ExploreInitState()) {
    on<ExploreGetDataEvent>(
      (event, emit) async {
        emit(ExploreLoadingState());
        var response = await _repository.getAllExplore();
        emit(
          ExploreSuccessResponseState(response),
        );
      },
    );
  }
}
