import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';
import '../utils/app_constants.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    print("🟡 API Calling: ${AppConstants.BASE_URL}${AppConstants.POPULAR_PRODUCT_URL}");

    Response response = await popularProductRepo.getPopularProductList();
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    print("Response HasError: ${response.hasError}");
    print("Response Error: ${response.statusText}");

    if(response.statusCode == 200){
      print("Got products successfully");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print("Products loaded: ${_popularProductList.length}");
      _isLoaded = true;
      update();
    } else {
      // Handle error
      print("API Error: ${response.statusText}");
      _isLoaded = false;
      update();
    }
  }
}