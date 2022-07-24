import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/account_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_details_model.dart';
import '../providers/user_details_provider.dart';
import '../utils/color_theme.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height - kAppBarHeight / 2,
          width: screenSize.width,
          child: Column(
            children: [
              IntroductionWidgetAccountScreen(),
              CustomMainButton(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.orange,
                  isLoading: false,
                  onPressed: () {}),
              CustomMainButton(
                  child: const Text(
                    'Sell',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.yellow,
                  isLoading: false,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SellScreen()));
                  }),
              ProductsShowcaseListView(
                  title: "Your Orders", children: testChildren),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Orders Requests',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Order : test',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Address: Somewhere testing'),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                  );
                },
                itemCount: 5,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetialsModel userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails!;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white.withOpacity(0.00000000000001),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Hello',
                    style: TextStyle(color: Colors.grey[800], fontSize: 26)),
                TextSpan(
                    text: '${userDetails.name}',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
              ])),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1644982647531-daff2c7383f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
