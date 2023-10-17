import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lmiis/provider/AuthProvider.dart';
import 'package:lmiis/provider/ESSPProvider.dart';
import 'package:lmiis/provider/JobProvider.dart';
import 'package:lmiis/provider/LocationProvider.dart';
import 'package:lmiis/provider/MyProfileProvider.dart';
import 'package:lmiis/provider/NewNoticePrvide.dart';
import 'package:lmiis/provider/UtilsProvider.dart';
import 'package:lmiis/provider/TrainingsProvider.dart';
import 'package:lmiis/repository/AuthRepo.dart';
import 'package:lmiis/repository/ESSPRepo.dart';
import 'package:lmiis/repository/JobsRepo.dart';
import 'package:lmiis/repository/LocationRepo.dart';
import 'package:lmiis/repository/MyProfileRepo.dart';
import 'package:lmiis/repository/NewNoticeRepo.dart';
import 'package:lmiis/repository/ViewAllTrainingsRepo.dart';
import 'package:lmiis/utils/Apis.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
final sl = GetIt.instance;


Future<void> init() async {

  sl.registerLazySingleton(() => DioClient(Apis.BASE_URL, sl(), loggingInterceptor: sl()));
  //Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LocationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => NewsNoticeRepo(dioClient: sl()));
  sl.registerLazySingleton(() => JobRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ViewAllTrainingsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ESSPRepo(dioClient: sl()));
  sl.registerLazySingleton(() => MyProfileRepo(dioClient: sl()));

  //Provider
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => LocationProvider(sl()));
  sl.registerFactory(() => NewsNoticeProvider(sl()));
  sl.registerFactory(() => JobProvider(sl()));
  sl.registerFactory(() => TrainingsProvider(sl()));
  sl.registerFactory(() => ESSPProvider(sl()));
  sl.registerFactory(() => UtilProvider());
  sl.registerFactory(() => MyProfileProvider(sl()));



  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());


}