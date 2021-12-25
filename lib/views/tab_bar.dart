import 'package:flutter/material.dart';
import 'package:dart_example/controllers/cart_controller.dart';
import 'package:dart_example/controllers/shopping_controller.dart';
import 'package:get/get.dart';

class MyTabBar extends StatefulWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  // define your tab controller here
  late TabController _tabController;

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: <Widget>[],
          // leading: Icon(
          //   Icons.add_shopping_cart_rounded,
          //   color: Colors.white,
          // ),
          elevation: 0,
          title: Text(
            'Top Sales',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: TabBar(
                controller: _tabController,
                labelColor: Color(0xFFDEFE71),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                tabs: <Widget>[
                  Text('Sort by'),
                  Text('Shoes'),
                  Text('FW 2021'),
                  Text('New Shoes'),
                ],
              ),
            ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: <Widget>[
            //       Center(
            //         child: Text(
            //           'BROTCHEN',
            //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       Center(
            //         child: Text(
            //           'KALTEGETRANKE',
            //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       Center(
            //         child: Text(
            //           'HEIBGETRANKE',
            //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       Center(
            //         child: Text(
            //           'MILCHPPODUKE',
            //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
