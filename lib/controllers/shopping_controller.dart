import 'package:dart_example/models/product.dart';
import 'package:get/state_manager.dart';

class ShoppingController extends GetxController {
  // ignore: deprecated_member_use
  var products = <Product>[].obs;

  get isLoading => null;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Dress',
          productLink:
              'https://i.pinimg.com/originals/fe/71/2d/fe712d4bb6e9a8d6e19f074d4c1a2688.jpg'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'shoes',
          productLink:
              'https://www.wallpaperup.com/uploads/wallpapers/2018/06/04/1268118/d8d805dd3a063862a5c79b495c5f5ac2-700.jpg'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'shoes',
          productLink:
              'https://www.desktopbackground.org/download/768x1280/2015/01/12/886148_girl-model-red-lips-lipstick-face-hand-hair-shoulders-black_8000x5622_h.jpg'),
    ];

    products.value = productResult;
  }
}
