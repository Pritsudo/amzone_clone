import 'dart:typed_data';

import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/loading_widget.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;

  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<int> keysForDiscout = [0, 70, 60, 50];
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? const LoadingWidget()
            : SingleChildScrollView(
                child: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              image == null
                                  ? Image.network(
                                      "data:image/png;base64,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",
                                      height: screenSize.height / 10,
                                    )
                                  : Image.memory(
                                      image!,
                                      height: screenSize.height / 10,
                                    ),
                              IconButton(
                                  onPressed: () async {
                                    Uint8List? temp = await Utils().pickImage();
                                    if (temp != null) {
                                      setState(() {
                                        image = temp;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.file_upload))
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            height: screenSize.height * 0.7,
                            width: screenSize.width * 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFieldWidget(
                                    title: 'Name',
                                    controller: nameController,
                                    obscureText: false,
                                    hintText: 'Enter the name of the item'),
                                TextFieldWidget(
                                    title: 'Cost',
                                    controller: costController,
                                    obscureText: false,
                                    hintText: 'Enter the cost of the item'),
                                const Text(
                                  'Discount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                ListTile(
                                  title: Text('None'),
                                  leading: Radio(
                                      value: 1,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: Text('70%'),
                                  leading: Radio(
                                      value: 2,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: Text('60%'),
                                  leading: Radio(
                                      value: 3,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: Text('50%'),
                                  leading: Radio(
                                      value: 4,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          CustomMainButton(
                              child: const Text(
                                'Sell',
                                style: TextStyle(color: Colors.black),
                              ),
                              color: Colors.yellow,
                              isLoading: isLoading,
                              onPressed: () async {
                                String output = await CloudFirestoreClass()
                                    .uploadProductToDatabase(
                                  image: image,
                                  productName: nameController.text,
                                  rawCost: costController.text,
                                  discount: keysForDiscout[selected - 1],
                                  seller: Provider.of<UserDetailsProvider>(
                                          context,
                                          listen: false)
                                      .userDetails!
                                      .name,
                                  sellerUid:
                                      FirebaseAuth.instance.currentUser!.uid,
                                );

                                if (output == 'success') {
                                  Utils().showSnackBar(
                                      context: context,
                                      content: "Posted product");
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                          CustomMainButton(
                              child: const Text(
                                'Back',
                                style: TextStyle(color: Colors.black),
                              ),
                              color: Colors.grey[300]!,
                              isLoading: false,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
