
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'features/home/data/source/firebase_data_serice.dart';

final sl = GetIt.instance;


void setupServiceLocator() {
 sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
 sl.registerSingleton<FireBaseDataService>(FireBaseDataServiceImp());
}
