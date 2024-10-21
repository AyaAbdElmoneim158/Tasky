class EndPoints {
  static String baseUrl = "https://todo.iraqsapp.com";
  // Auth.......................................................................
  static String login = "/auth/login";
  static String register = "/auth/register";
  static String logout = "/auth/logout";
  static  String profile = "/auth/profile";
  static  String refreshToken = "/auth/refresh-token";

  // Todos.......................................................................
  static  String getTodosList = "/todos";
  static String getTodo(String id) => "/todos/$id";
  static  String createTask = "/todos";
  static String editTask(String id) => "/todos/$id";
  static String deleteTask(String id) => "/todos/$id";

  static  String uploadImage = "/upload/image";
}

class ApiKey {
  ApiKey._();

  static String statusCode = "statusCode";
  static String token = "token";
  static String message = "message";
  static String id = "_id";

  static String displayName = "displayName";
  static String accessToken = "access_token";
  static String refreshToken = "refresh_token";
  static  String userId = 'user_id';

  static String username = "username";
  static String experienceYears = "experienceYears";
  static String address = "address";
  static String level = "level";
  static String phone = "phone";
  static String password = "password";

  static  String  accept= 'Accept';
  static  String  authorization= 'Authorization';
  static  String setBearerAccessToken(String accessToken) => "Bearer $accessToken";
  static  String applicationJson = 'application/json';
  // static  String  = '';
  // static  String  = '';
// static  String  = '';
  // static  String  = '';
  

  
}
