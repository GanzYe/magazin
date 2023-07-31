import 'package:magazin/models/order.dart';
import 'package:magazin/services/kaspi_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final kaspiOrderDataProvider = FutureProvider<List<OrderModel>>((ref) async{
  return ref.watch(kaspiOrderProvider).getDeliveryOrders();
});