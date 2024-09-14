import 'package:dio/dio.dart';
import '../utils/helpers/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-Type"] = 'application/json';
    options.headers["Authorization"] = CacheHelper.getData(key: ApiKey.token);
    super.onRequest(options, handler);
  }
}
