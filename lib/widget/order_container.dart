import 'package:flutter/material.dart';
import 'package:magazin/widget/vertical_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderContainer extends StatelessWidget {
  final String phoneNumber;
  final String address;
  final String name;

  const OrderContainer(this.phoneNumber, this.address, this.name);

  void _launchPhoneNumber() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Не удалось выполнить вызов: tel');
    }
  }

  void _openMapWithAddress() async {
    final Uri addressUri = Uri.parse("dgis://2gis.kz/search/$address");
    await launchUrl(addressUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title:  Text(address),
                  subtitle:  Text(name),
                  onTap: (){
                    _openMapWithAddress();
                  },
                ),
                ListTile(
                  title: Text(phoneNumber),
                  onTap: (){
                    _launchPhoneNumber();
                  },
                ),
              ],
            ),
          )),
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
            ),
            width: 50,
            child: TextButton(
              onPressed: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  context: context,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),

                  )
              ),
              child: const VerticalText('КОД'),
            )
            ,
          ),
        ],
      ),
    );
  }
}
