
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qolber_clean_arc/features/auth/data/models/user_model.dart';
import 'package:qolber_clean_arc/features/auth/domain/entity/user_entity.dart';

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
  Future<UserEntity> getUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      throw Exception('Пользователь не авторизован');
    }

    try {
      final doc = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser.uid)
          .get();
      print('User data: ${doc.data()}');


      if (!doc.exists || doc.data() == null) {
        throw Exception('Данные пользователя не найдены');
      }

      return UserModel.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Нет подключения к интернету');
      } else {
        throw Exception('Ошибка Firebase: ${e.message}');
      }
    }
  }

  @override
  Future<void> toggleLike(String postId, String userId) {
    // TODO: implement toggleLike
    throw UnimplementedError();
  }









}