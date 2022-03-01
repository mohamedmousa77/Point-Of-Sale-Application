import 'package:get/get.dart';
import '../models/busniss_model.dart';
import '../services/busniss_service.dart';

class BusnissController extends GetxController {
  bool isLoading = true;
  List<Business> busnissList = [];

  Future<void> fetchBusniss() async {
    try {
      //if the application in proccess to get the data, this means that the app
      //is weating
      isLoading = true;

      List<Business> busniss = await BusnissApi().getBusnissFromJson();

      //assigning all the elements of busniss that came from api to the variable "busnissList"
      if (busniss.isNotEmpty) {
        busnissList = busniss;
        update();
      }
    } finally {
      isLoading = false;
    }
  }
}
