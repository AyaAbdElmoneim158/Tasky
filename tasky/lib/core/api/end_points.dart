class EndPoints {
  static String baseUrl = "https://todo.iraqsapp.com";
  // Auth.......................................................................
  static String login = "/auth/login";
  static String register = "/auth/register";
  static String logout = "/auth/logout";
  static const String profile = "/auth/profile";
  static const String refreshToken = "/auth/refresh-token";

  // Todos.......................................................................
  static const String getTodosList = "/todos";
  static String getTodo(String id) => "/todos/$id";
  static const String createTask = "/todos";
  static String editTask(String id) => "/todos/$id";
  static String deleteTask(String id) => "/todos/$id";

  static const String uploadImage = "/upload/image";
}

class ApiKey {
  static String statusCode = "statusCode";
  static String token = "token";
  static String message = "message";
  static String id = "_id";

  static String displayName = "displayName";
  static String accessToken = "access_token";
  static String refreshToken = "refresh_token";
  static const String userId = 'user_id';

  static String username = "username";
  static String experienceYears = "experienceYears";
  static String address = "address";
  static String level = "level";
}
