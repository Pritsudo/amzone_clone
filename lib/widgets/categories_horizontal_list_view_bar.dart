import 'package:amazon_clone/screens/result_screen.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class CatagoriesHorizontalListViewBar extends StatelessWidget {
  const CatagoriesHorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
          context,
          MaterialPageRoute( 
            builder: (context) => ResultScreen(
              query: categoriesList[index],
            ),
          ),
        );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(categoryLogos[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Text(categoriesList[index]),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: categoriesList.length,
      ),
    );
  }
}
