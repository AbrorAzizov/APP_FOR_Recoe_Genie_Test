import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:flutter/foundation.dart' show immutable;

import '../domain/entities/post.dart';

@immutable
abstract class HomeEvent {}

@immutable
class HomeEventFetchUsers extends HomeEvent{}

@immutable
class HomeEventCreatePost extends HomeEvent{
  final Post post;
  final String? imagePath;
  final Uint8List? imageBytes;

  HomeEventCreatePost(this.imagePath, this.imageBytes, {required this.post});
}

class HomeEventDeletePost extends HomeEvent{
  final String postId;

  HomeEventDeletePost({required this.postId});
}