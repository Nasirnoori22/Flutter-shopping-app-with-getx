// ignore_for_file: deprecated_member_use
import 'package:dart_example/controllers/cart_controller.dart';
import 'package:dart_example/controllers/shopping_controller.dart';
import 'package:dart_example/controllers/priceController.dart';
import 'package:dart_example/views/add_to_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_example/views/tab_bar.dart';

class ShoppingPage extends StatefulWidget {
  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingController = Get.put(ShoppingController());

  final cartController = Get.put(CartController());

  final priceController = Get.put(PriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.black,
              child: MyTabBar(),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.black,
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${controller.products[index].productLink}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 200,
                                  width: 370,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 150,
                                              left: 0,
                                            ),
                                            child: Text(
                                              '${controller.products[index].productName}',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 150, left: 0),
                                            child: Text(
                                                '\$${controller.products[index].price}',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 0, bottom: 0),
                                      child: RaisedButton(
                                        onPressed: () {
                                          cartController.addToCart(
                                              controller.products[index]);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        color: Color(0xFFDEFE71),
                                        textColor: Colors.black,
                                        child: Text('Add to Cart'),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      AdToCard(),
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
