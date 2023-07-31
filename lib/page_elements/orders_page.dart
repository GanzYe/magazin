import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:magazin/provider/data_provider.dart';
import 'package:magazin/models/order.dart';

import '../widget/order_container.dart';

class OrdersPage extends ConsumerWidget{
    const OrdersPage({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(kaspiOrderDataProvider);
    return Container(
        child: _data.when(
            data: (_data){
              List<OrderModel> orderList = _data.map((e)=>e).toList();
              return ListView.builder(
                itemCount: orderList.length,
                shrinkWrap: true,
                itemBuilder: (_, index) =>Column(
                    children: [
                      OrderContainer("+7${orderList[index].cellPhone}", "${orderList[index].streetName} ${orderList[index].streetNumber} ${orderList[index].apartment}", "${orderList[index].firstName} ${orderList[index].lastName}"),
                      const Gap(15),
                    ]
                )
              );
            },

            error: (err,s) => Text(err.toString()),

            loading: ()=> const Center(
                child: CircularProgressIndicator(),
            )),
    );
  }

}