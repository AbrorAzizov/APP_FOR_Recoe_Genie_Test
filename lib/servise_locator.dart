
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:qolber_clean_arc/features/home/data/repo/post_repo_imp.dart';
import 'package:qolber_clean_arc/features/home/storage/domain/storage_repo.dart';

import 'features/home/data/source/firebase_data_serice.dart';
import 'features/home/domain/repository/post_repo.dart';
import 'features/home/storage/data/storage_repo_imp.dart';

final sl = GetIt.instance;


void setupServiceLocator() {
 sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
 sl.registerSingleton<FireBaseDataService>(FireBaseDataServiceImp());
 sl.registerSingleton<PostRepo>(FireBasePostRepoImp());
 sl.registerSingleton<StorageRepo>(FirebaseStorageRepo());
}
