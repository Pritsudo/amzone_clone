import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double offset = 0;
  ScrollController controller = ScrollController();
  List<Widget> testChildren = [
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png"),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
    ),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SearchBarWidget(isReadOnly: true, hasBackButton: false),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: controller,
                // scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(height: kAppBarHeight/2,),
                    CatagoriesHorizontalListViewBar(),
                  BannerAdWidget(),
                    ProductsShowcaseListView(
                        title: "Upto 70% off", children: testChildren),
                    ProductsShowcaseListView(
                        title: "Upto 60% off", children: testChildren),
                    ProductsShowcaseListView(
                        title: "Upto 50% off", children: testChildren),
                    ProductsShowcaseListView(
                        title: "Explore", children: testChildren),
                  ],
                ),
              ),
              UserDetailsBar(offset: offset, userDetails: UserDetialsModel(name: 'Prit', address: 'Test Address'),)
            ],
          )),
    );
  }
}
