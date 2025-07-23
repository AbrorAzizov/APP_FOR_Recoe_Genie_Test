

import 'package:dartz/dartz.dart';
import 'package:qolber_clean_arc/features/home/domain/entities/post.dart';

import '../../../../core/errors/firestore_failure.dart';

abstract class PostRepo {
  Future<Either<FireStoreFailure, List<Post>>> fetchAllPost();
  Future<String?> getUserId();
  Future<Either> deletePost(String postId);
  Future<Either> createPost(Post post);
  Future<Either> fetchPostByUserId (String userId);
}