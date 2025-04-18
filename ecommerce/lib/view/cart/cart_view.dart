import 'package:ecommerce/view/payment/payment_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<dynamic> carts = [
    {
      "title": "Airpod",
      "amount": "1",
      "image": "assets/images/airpod.webp",
      "price": "130",
    },
    {
      "title": "Macbook",
      "amount": "2",
      "image": "assets/images/macbook.webp",
      "price": "1200",
    },
    {
      "title": "Iphone pro",
      "amount": "1",
      "image": "assets/images/iphones.webp",
      "price": "1500",
    },
    {
      "title": "Ipad",
      "amount": "2",
      "image": "assets/images/ipad.webp",
      "price": "600",
    },
    {
      "title": "Reami",
      "amount": "3",
      "image": "assets/images/reami.webp",
      "price": "500",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        title: Text("My Cart"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: carts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(carts[index]['image']),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(carts[index]['title']),
                        ),
                        Text("ຈຳນວນ: ${carts[index]['amount']}"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text("ລາຄາ: "),
                              Text(
                                "${carts[index]['price']} \$",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: 
      Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentView()),
                );
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Checkout for 1830.00\$ ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    
    );
  }
}
