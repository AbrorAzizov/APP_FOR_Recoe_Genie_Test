
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qolber_clean_arc/features/home/domain/entities/post.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/post_repo.dart';

import '../../../../core/errors/firestore_failure.dart';
import '../../../../servise_locator.dart';
import '../source/firebase_data_serice.dart';

class FireBasePostRepoImp implements PostRepo {
  @override
  Future<Either> createPost(Post post) {
   return sl<FireBaseDataService>().createPost(post);
  }

  @override
  Future<Either> deletePost(String postId) async{
    return  await sl<FireBaseDataService>().deletePost(postId);
  }

  @override
  Future<Either<FireStoreFailure,List<Post>>> fetchAllPost() async{
    return await sl<FireBaseDataService>().fetchAllPost();
  }

  @override
  Future<Either> fetchPostByUserId(String userId) async{

    return  await sl<FireBaseDataService>().fetchPostByUserId(userId);
  }

  @override
  Future<String?> getUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    return user?.uid; // returns uid or null if not logged in
  }



}