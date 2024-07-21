class Consts{
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String users = "users/";
  static String posts({required int userId}) => "$userId/posts/";
  static String todos ({required int userId}) => "$userId/todos/";
  static String albums({required int userId}) => "$userId/albums";
  static String photos({required int albumId}) => "$albumId/photos";
}