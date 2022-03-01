import 'package:get/get.dart';

class CustomerTypeController extends GetxController {
  var CustomerType = "Customer Type";

  void firstTypeSelected() {
    CustomerType = 'First type';
  }

  void secondTypeSelected() {
    CustomerType = 'Second type';
  }

  @override
  void onInit() {
    firstTypeSelected();
    secondTypeSelected();
    super.onInit();
  }
}
