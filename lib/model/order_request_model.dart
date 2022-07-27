import 'package:flutter/foundation.dart';

class OrderRequesModel {
  final String orderName;
  final String buyersAddress;


  OrderRequesModel({
    required this.orderName,
    required this.buyersAddress,
  
  });

  Map<String, dynamic> getJson() =>
      {'orderName': orderName, 'buyersAddress': buyersAddress};

  factory OrderRequesModel.getModelFromJson(
      {required Map<String, dynamic> json}) {
    return OrderRequesModel(
        orderName: json['orderName'], buyersAddress: json['buyersAddress']);
  }
}
