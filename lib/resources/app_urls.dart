class AppUrls {
  static const String baseUrl = "http://localhost:8666/api";
  static const String signInUrl = "$baseUrl/users/login/";
  static const String userRegister = "$baseUrl/users/register/";

  ///product related APIS============
  static const String productCategories = "$baseUrl/products/categories/";
  static const String products = "$baseUrl/products/";

  ///purchases related APIS============
  static const String transactionPurchases = "$baseUrl/transactions/purchases/";

  ///rental related APIS============
  static const String rentalPurchases = "$baseUrl/transactions/rentals/";
}
