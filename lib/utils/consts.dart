class Consts{
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String users = "users/";
  static String posts({required String userId}) => "$userId/posts/";
  static String todos ({required String userId}) => "$userId/todos/";
  static String albums({required String userId}) => "$userId/albums";
  static String photos({required String albumId}) => "$albumId/photos";
}