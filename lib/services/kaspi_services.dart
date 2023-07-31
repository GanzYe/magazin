import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:magazin/models/order.dart';

class KaspiApi{
  var headers = {
    'X-Auth-Token': 'vrWkL1VaMwiAnVUx9yELnSHC0fldV9ZMs+tudQeOjQs=',
    'Cookie': 'layout=d',
    'Accept': '*/*'
  };

  Future<List<OrderModel>> getDeliveryOrders() async {
    DateTime now = DateTime.now();
    int timeMillis = now.millisecondsSinceEpoch - 800000000;
    var response = await get(
      Uri.parse('https://kaspi.kz/shop/api/v2/orders?page[number]=0&page[size]=20&filter[orders][state]=DELIVERY&filter[orders][creationDate][\$ge]=$timeMillis&filter[orders][status]=APPROVED_BY_BANK&filter[orders][deliveryType]=DELIVERY&filter[orders][signatureRequired]=false&include[orders]=user'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e)=>OrderModel.fromJson(e)).toList();
    }
    else {
      throw Exception(response.statusCode);
    }
  }
}

final kaspiOrderProvider = Provider<KaspiApi>((ref)=>KaspiApi());