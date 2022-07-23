import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

import '../model/user_details_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
      body: Center(
        child: Column(
          children: [
            UserDetailsBar(
                offset: 0,
                userDetails: UserDetialsModel(
                    name: 'test name', address: 'Test Address')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMainButton(
                  child: const Text(
                    'Proceed to buy n item',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: yellowColor,
                  isLoading: false,
                  onPressed: () {}),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    product: ProductModel(
                        url:
                            'https://images.unsplash.com/photo-1649859395314-bdea587e4524?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
                        productName: 'test',
                        cost: 100,
                        discount: 50,
                        uid: 'Ssssssss',
                        sellerName: 'Test seller',
                        sellerUid: 'sss',
                        rating: 5,
                        noOfRating: 5),
                  );
                },
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
