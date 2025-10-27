class AppConstants{
  //static const String App_Name = "DBFood";
  //static const int App_VERSION = 1;

  static const String BASE_URL = "https://mvs.bslmeiyu.com";
  static const String POPULAR_PRODUCT_URL = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";

  static const String TOKEN = "DBtoken";

  static String getImageUrl(String imagePath) {
    return '$BASE_URL/$imagePath';
  }
}