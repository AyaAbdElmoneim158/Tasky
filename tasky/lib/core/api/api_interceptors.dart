import 'package:dio/dio.dart';

import '../utils/helpers/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'application/json';
    // Await the access token asynchronously
    final accessToken = await CacheHelper.getString(ApiKey.accessToken);
    if (accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    handler.next(options); // Continue with the request
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Handle token refresh when unauthorized
      final refreshToken = await CacheHelper.getString(ApiKey.refreshToken);
      if (refreshToken.isNotEmpty) {
        final success = await _refreshToken(refreshToken);
        if (success) {
          // Clone and retry the request with new tokens
          RequestOptions requestOptions = err.requestOptions;
          final newAccessToken = await CacheHelper.getString(ApiKey.accessToken);
          final newResponse = await Dio().request(
            requestOptions.path,
            options: Options(
              method: requestOptions.method,
              headers: {
                "Authorization": "Bearer $newAccessToken",
              },
            ),
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
          );
          return handler.resolve(newResponse);
        }
      }
    }
    return super.onError(err, handler);
  }

  Future<bool> _refreshToken(String refreshToken) async {
    try {
      /*final authRepo = sl<AuthRepoImpl>();
      final response = await authRepo.refreshToken(refreshToken);
      final accessToken = response.accessToken;
      if (accessToken != null) {
        // Save new access token
        await CacheHelper.saveData(ApiKey.accessToken, accessToken);
        DioConsumer(dio: sl()).setTokenIntoHeaderAfterLogin(accessToken);
        return true;
      }*/
      return true;
    } catch (e) {
      // Handle exception, logging, etc.
    }
    return false;
  }
}
