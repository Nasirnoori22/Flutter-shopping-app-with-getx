import 'package:dart_example/models/price.dart';
import 'package:get/state_manager.dart';

class PriceController extends GetxController {
  // ignore: deprecated_member_use
  var prices = <Price>[].obs;

  get isLoading => null;

  @override
  void onInit() {
    super.onInit();
    fetchPrice();
  }

  void fetchPrice() async {
    await Future.delayed(Duration(seconds: 1));
    var priceResult = [
      Price(
        id: 1,
        amount: 30,
      ),
      Price(
        id: 2,
        amount: 40,
      ),
      Price(
        id: 3,
        amount: 49.5,
      ),
      Price(
        id: 3,
        amount: 49.5,
      )
    ];

    prices.value = priceResult;
  }
}
