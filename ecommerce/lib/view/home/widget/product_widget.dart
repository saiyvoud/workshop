import 'package:ecommerce/view/home/detail/home_detail.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<dynamic> product = [
    {
      "title": "Airpod",
      "detail": "Airpod good",
      "image": "assets/images/airpod.webp",
      "price": "130",
    },
    {
      "title": "Macbook",
      "detail": "Macbook Air m3",
      "image": "assets/images/macbook.webp",
      "price": "1200",
    },
    {
      "title": "Iphone pro",
      "detail": "Iphone 16 pro mac",
      "image": "assets/images/iphones.webp",
      "price": "1500",
    },
    {
      "title": "Ipad",
      "detail": "Ipad pro max",
      "image": "assets/images/ipad.webp",
      "price": "600",
    },
    {
      "title": "Reami",
      "detail": "Ream1 1 ລ້ານ pixel",
      "image": "assets/images/reami.webp",
      "price": "500",
    },
  ];
 
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: product.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetail(image: product[index]['image']),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(product[index]['image'], fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [Text(product[index]['title']), Spacer(), Text("*4.9")],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product[index]['price'] + '\$',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
