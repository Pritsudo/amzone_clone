import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel products;
  const ResultWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(productModel: products)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: screenSize.width / 3, child: Image.network(products.url)),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                products.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  SizedBox(
                      width: screenSize.width / 5,
                      child: FittedBox(
                          child: RatingStarWidget(rating: products.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      products.noOfRating.toString(),
                      style: const TextStyle(color: activeCyanColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    child: CostWidget(
                        color: Color.fromARGB(255, 112, 12, 5),
                        cost: products.cost))),
                       
          ],
        ),
      ),
    );
  }
}
