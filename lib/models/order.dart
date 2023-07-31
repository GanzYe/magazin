import 'dart:convert';

import 'package:http/http.dart';

class OrderModel{
  final String id;
  final String code;
  final double totalPrice;
  final String streetName;
  final String streetNumber;
  final String?apartment;
  final String formattedAddress;
  final double latitude;
  final double longitude;

  final String firstName;
  final String lastName;
  final String cellPhone;

  OrderModel(
      {required this.id,
       required this.code,
       required this.totalPrice,
       required this.streetName,
       required this.streetNumber,
       required this.apartment,
       required this.formattedAddress,
       required this.latitude,
       required this.longitude,
       required this.firstName,
       required this.lastName,
       required this.cellPhone,
      });

  factory OrderModel.fromJson(Map<String,dynamic> data)  {
    return OrderModel(
        id: data['id'],
        code: data['attributes']['code'],
        totalPrice: data['attributes']['totalPrice'],
        streetName: data['attributes']['deliveryAddress']['streetName'],
        streetNumber: data['attributes']['deliveryAddress']['streetNumber'],
        apartment: data['attributes']['deliveryAddress']['apartment'],
        formattedAddress: data['attributes']['deliveryAddress']['formattedAddress'],
        latitude: data['attributes']['deliveryAddress']['latitude'],
        longitude: data['attributes']['deliveryAddress']['longitude'],
        firstName: data['attributes']['customer']['firstName'],
        lastName: data['attributes']['customer']['lastName'],
        cellPhone: data['attributes']['customer']['cellPhone'],
    );
  }
}

