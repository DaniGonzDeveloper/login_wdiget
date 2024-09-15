// import 'package:dio/dio.dart';

// class DioClient {
//   late Dio dio;
//   late Dio dioNoInterceptor;

//   DioClient() {
//     dio = Dio();
//     dioNoInterceptor = Dio();
//     dio.interceptors.add(ApiInterceptors());
//     dio.options.baseUrl = "https://restaurant.api.barabierto.es";
//     dioNoInterceptor.options.baseUrl = "https://restaurant.api.barabierto.es";
//     dioNoInterceptor.options.validateStatus = (status) => true;
//   }

//   ApiFailureResult manageError(Exception e, Response? response) {

//     ApiFailureResult apiFailedResponse = ApiFailureResult(500, "ups, algo salió mal", "ups, algo salió mal");

//     if(e is DioError) {
//       if (e.type == DioErrorType.response) {
//         // return ApiFailure(e.response!.data['message']);
//         if(response != null) {
//           apiFailedResponse = ApiFailureResult.fromJson(response.data);
//         }
//       } else if (e.type == DioErrorType.connectTimeout) {
//         // print('check your connection');
//         apiFailedResponse = ApiFailureResult(408, "Revisa su conexión", "Revisa su conexión");
//       } else if (e.type == DioErrorType.receiveTimeout) {
//         // print('unable to connect to the server');
//         apiFailedResponse = ApiFailureResult(503, "No es posible acceder al servidor", "No es posible acceder al servidor");
//       } 
//     }
    
//     return apiFailedResponse;
//   }
// }

// class ApiInterceptors extends Interceptor {
//   // Dio _dioToken;
//   // Dio _currentDio;

//   ApiInterceptors();

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     UserDatabaseUtility userDatabaseUtility = getIt<UserDatabaseUtility>();
//     User user;
//     if (userDatabaseUtility.alredyLoginIn() == UserExistsResult.success) {
//       user = userDatabaseUtility.boxUser.getAt(0)!;
//       options.headers["Authorization"] = "Bearer " + user.token;
//       // options.headers["restaurantId"] = Globals.userManager.user!.currentRestaurant.id;
//       options.connectTimeout = 7000;
//       options.receiveDataWhenStatusError = true;
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response != null && err.response!.statusCode == 401) {
//       try {
//         UserDatabaseUtility userDatabaseUtility = getIt<UserDatabaseUtility>();
//         User user;
//         if (userDatabaseUtility.alredyLoginIn() == UserExistsResult.success) {
//           user = userDatabaseUtility.boxUser.getAt(0)!;
//           Response tokenResponse = await getIt<DioClient>().dioNoInterceptor.post("/user/refreshToken", queryParameters: {
//             'refreshToken': user.refreshToken,
//           });
//           user.token = tokenResponse.data["token"];
//           user.refreshToken = tokenResponse.data["refreshToken"];
//           userDatabaseUtility.boxUser.putAt(0, user);
//           var request = err.response!.requestOptions;
//           Response response = await getIt<DioClient>().dio.request(request.path,
//               data: request.data, queryParameters: request.queryParameters);
//           return handler.resolve(response);
//         } else {
//           handler.next(err);
//         }
//       } on DioError catch (e) {
//         handler.next(e);
//       }
//     }
//     handler.next(err);
//   }
// }
