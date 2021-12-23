import 'package:dart_example/controllers/cart_controller.dart';
import 'package:dart_example/controllers/shopping_controller.dart';
import 'package:dart_example/controllers/priceController.dart';
import 'package:dart_example/views/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:dart_example/views/tab_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dart_example/views/tab_bar.dart';

// ignore: must_be_immutable
class AdToCard extends StatelessWidget {
  AdToCard({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  final priceController = Get.put(PriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.black,
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: GetX<CartController>(builder: (controller) {
                      return Text(
                        '${controller.totalPrice}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      );
                    }),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.only(left: 25, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      color: Color(0xFFDEFE71),
                      textColor: Colors.black,
                      child: Text('Buy Now'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              color: Colors.black,
              child: Container(
                margin: EdgeInsets.only(left: 40, top: 20),
                child: Text(
                  'Nike ZoomX invincible',
                  style: TextStyle(
                      color: Color(0xFFDEFE71), fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              color: Colors.black,
              child: Container(
                // margin: EdgeInsets.only(top: 200),
                child: Image.network(
                  Get.find<CartController>().cartItems[0].productLink,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(right: 130),
              child: Text(
                'Size',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: GetX<PriceController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.prices.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 60,
                                margin: EdgeInsets.only(
                                    left: 25, bottom: 0, right: 0, top: 12),
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  color: Color(0xFFDEFE71),
                                  textColor: Colors.black,
                                  child: Text(
                                      '${controller.prices[index].amount}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100, bottom: 180),
              height: 50,
              child: MyHomePage(),
            )
          ],
        ),
      ),
    );
  }
}
