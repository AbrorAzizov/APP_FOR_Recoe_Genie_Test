
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:qolber_clean_arc/features/home/domain/entities/post.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/post_repo.dart';

import '../../../../core/errors/firestore_failure.dart';
import '../../../../servise_locator.dart';
import '../../../auth/data/models/sign_up_parameters.dart';
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
  Future<UserModel> getUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final doc = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();

    final data = doc.data()!;
    return UserModel.fromMap(data);

  }






}