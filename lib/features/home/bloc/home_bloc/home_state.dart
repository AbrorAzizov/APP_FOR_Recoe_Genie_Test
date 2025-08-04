



import 'package:flutter/foundation.dart' show immutable;
import 'package:qolber_clean_arc/features/auth/domain/entity/user_entity.dart';
import 'package:qolber_clean_arc/features/home/domain/entities/post.dart';

import '../../../../core/errors/firestore_failure.dart';

@immutable
abstract class HomeState {}

@immutable
class HomeStateLoading extends HomeState{}


@immutable
class HomeStateLoaded extends HomeState{
  final UserEntity userEntity;
  final List<Post> posts;

  HomeStateLoaded({required this.userEntity,required this.posts});
}

@immutable
class HomeStateInitial extends HomeState{}



@immutable
class HomeStateError extends HomeState {
  final FireStoreFailure failure;

  HomeStateError({required this.failure});
}

