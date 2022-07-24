import 'package:amazon_clone/widgets/result_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Showing results for ", style: TextStyle(fontSize: 17)),
                TextSpan(
                    text: query,
                    style: const TextStyle(
                        fontSize: 17, fontStyle: FontStyle.italic)),
              ])),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2/3
                ),
                itemBuilder: (context, index) {
                  return ResultWidget(products: ProductModel(
                          url:
                              'https://images.unsplash.com/photo-1649859395314-bdea587e4524?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
                          productName: 'test test etts test tes te ste ete etete ete ete et etet',
                          cost: 100,
                          discount: 50,
                          uid: 'Ssssssss',
                          sellerName: 'Test seller',
                          sellerUid: 'sss',
                          rating: 2,
                          noOfRating: 5),);
                }),
          )
        ],
      ),
    );
  }
}
