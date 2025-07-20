import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_event.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_state.dart';
import 'package:qolber_clean_arc/features/home/data/models/post_model.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/post_repo.dart';
import 'package:qolber_clean_arc/features/home/storage/domain/storage_repo.dart';
import '../../../servise_locator.dart';
import '../domain/entities/post.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final postRepo = sl<PostRepo>();
  final storageRepo = sl<StorageRepo>();

  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventCreatePost>(_onHomeEventCreateUser);
    on<HomeEventCreatePost>(_onHomeEventDeleteUser);
  }

  Future<void> _onHomeEventCreateUser(
    HomeEventCreatePost event,
    Emitter<HomeState> emit,
  ) async {
    String? imageUrl;

    emit(HomeStateLoading());
    if (event.imagePath != null) {
      imageUrl =
          await storageRepo.uploadPostImageMob(event.imagePath!, event.post.id);
    }

    if (event.imageBytes != null) {
      imageUrl = await storageRepo.uploadPostImageWeb(
          event.imageBytes! as Uint8List, event.post.id);
    }

    final newPost = event.post.copyWith(imageUrl: imageUrl);
    final result = await postRepo.createPost(newPost);
    result.fold((error) => HomeStateError(failure: error), (data) => emit(HomeStateLoaded()),);
  }
}
