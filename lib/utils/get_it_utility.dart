import 'package:get_it/get_it.dart';

import '../cubits/login/login_screen_cubit.dart';
import 'dio_client.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit());
  // getIt.registerLazySingleton<DioClient>(() => DioClient());
}


bool test(String test1, String test2) {
  return true;
}
