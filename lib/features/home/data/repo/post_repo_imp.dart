
import 'package:dartz/dartz.dart';
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
  Future<Either<FireStoreFailure,List<Post>>> fetchAllPost(String postId) async{
    return await sl<FireBaseDataService>().fetchAllPost(postId);
  }

  @override
  Future<Either> fetchPostByUserId(String userId) async{

    return  await sl<FireBaseDataService>().fetchPostByUserId(userId);
  }

}