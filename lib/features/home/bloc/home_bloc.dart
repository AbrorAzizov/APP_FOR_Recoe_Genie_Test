
import 'package:bloc/bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_event.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_state.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/post_repo.dart';
import 'package:qolber_clean_arc/features/home/storage/domain/storage_repo.dart';
import '../../../servise_locator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final postRepo = sl<PostRepo>();
  final storageRepo = sl<StorageRepo>();

  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventCreatePost>(_onHomeEventCreatePost);
    on<HomeEventDeletePost>(_onHomeEventDeletePost);
    on<HomeEventFetchAllPosts>(_onHomeEventFetchAllPosts);
  }




  Future<void> _onHomeEventFetchAllPosts(
    HomeEventFetchAllPosts event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());
    final response = await postRepo.fetchAllPost();
    response.fold(
          (error) => emit(HomeStateError(failure: error)),
      (posts) {
        emit(HomeStateLoaded(posts: posts));
      },
    );
  }

  Future<void> _onHomeEventDeletePost(
    HomeEventDeletePost event,
    Emitter<HomeState> emit,
  ) async {

    final response = await postRepo.deletePost(event.postId);

    response.fold(
      (l) => emit(HomeStateError(failure: l)),
      (r) { return null;
      },
    );
  }

  Future<void> _onHomeEventCreatePost(
    HomeEventCreatePost event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());
    final result = await postRepo.createPost(event.post);
    result.fold(
          (error) => emit(HomeStateError(failure: error)),
      (data) =>  null
    );
  }
}
