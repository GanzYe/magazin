import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:magazin/page_elements/orders_page.dart';

void main() {
  runApp(ProviderScope(child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kaspi',
        theme: ThemeData(),
        home:  const HomePage(),
      )
    )
  );
}

class HomePage extends StatelessWidget{
  const HomePage({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: ListTile(
          title: Text(
            'курьер',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
          subtitle: const Text(
            'Фаррух Матмусаев',
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Заказы:',
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      elevation:0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.red)
                      )
                    ),
                    onPressed: () {
                    },
                    child: const Text('+ добавить',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Gap(15),
              const OrdersPage(),
            ] ,
          ),
        ),
      ),
    );
  }
}
