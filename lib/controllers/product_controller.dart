import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  //this method will fetch all the product from the api
  Future<List<Product>> search({
    int? categoryId,
    int? brandId,
    int? idProduct,
    String? barcodeType,
    String? nameProduct,
  }) async {
    List<Product> myProduct = await ProductApi().search(
      idProduct: idProduct,
      brandId: brandId,
      barcodeType: barcodeType,
      nameProduct: nameProduct,
    );

    return myProduct;
  }
}
