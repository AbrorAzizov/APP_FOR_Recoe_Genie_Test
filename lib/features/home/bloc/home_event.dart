
import 'dart:io';

import 'package:flutter/foundation.dart' show immutable;
import 'dart:typed_data';

import '../domain/entities/post.dart';

@immutable
abstract class HomeEvent {}

@immutable
class HomeEventFetchUser extends HomeEvent{}

class HomeEventFetchAllPosts extends HomeEvent{}


@immutable
class HomeEventCreatePost extends HomeEvent{
  final Post post;
  final String? imagePath;
  final Uint8List? imageBytes;

  HomeEventCreatePost(this.imagePath, this.imageBytes, {required this.post, File? imagePath );
}

class HomeEventDeletePost extends HomeEvent{
  final String postId;

  HomeEventDeletePost({required this.postId});
}