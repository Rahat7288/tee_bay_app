class AppUrls {
  static const String baseUrl = "http://localhost:8666/api";
  static const String signInUrl = "$baseUrl/users/login/";
  static const String userRegister = "$baseUrl/users/register/";

  ///product related APIS============
  static const String productCategories = "$baseUrl/products/categories/";
  static const String products = "$baseUrl/products/";
  static String updateProduct(id) => "$baseUrl/products/$id/";
  static String deleteProduct(id) => "$baseUrl/products/$id/";
  static String getMyProduct(id) => "$baseUrl/products/my/$id/";

  ///purchases related APIS============
  static const String transactionPurchases = "$baseUrl/transactions/purchases/";

  ///rental related APIS============
  static const String rentalPurchases = "$baseUrl/transactions/rentals/";

  ///test api
  static const String testBase = "https://jsonplaceholder.typicode.com";
  static const String testApi = "$testBase/todos";
}
