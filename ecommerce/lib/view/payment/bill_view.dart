import 'package:ecommerce/components/bottomNavigatorWidget.dart';
import 'package:ecommerce/view/payment/widget/wave_widget.dart';
import 'package:flutter/material.dart';

class BillView extends StatefulWidget {
  const BillView({super.key});

  @override
  State<BillView> createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
  List<dynamic> product = [
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
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.network(
              width: double.infinity,
              fit: BoxFit.cover,
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK_vgd9BKhvfsBF560shPTGpQrONBd-1Idj8KiTkAzJI43-BCIMl3dZVLe8CvcoOZ5Evg&usqp=CAU",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ClipPath(
                  clipper: ZigZagClipper(),
                  child: Container(
                    width: 330.0,
                    height: 530.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'ສຳເລັດ',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4.0,
                            right: 10,
                            left: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ວັນທີ່ ແລະ ເວລາ:",
                                style: TextStyle(fontSize: 11),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ຊື່",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ຈຳນວນ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ລາຄາ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),

                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: product.length,
                                  itemBuilder: (context, index) {
                                    final data = product;
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              data[index]['title'],
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              data[index]['amount'].toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              data[index]['price'].toString(),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(indent: 20, endIndent: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ທີ່ຢູ່ຈັດສົ່ງ",
                                style: TextStyle(fontSize: 11),
                              ),
                              Text(
                                "ບ້ານທົ່ງສ້າງນາງ ເມືອງຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ບໍລິສັດຂົນສົ່ງ",
                                style: TextStyle(fontSize: 11),
                              ),
                              Text("ມີໄຊ", style: TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ເບີໂທ", style: TextStyle(fontSize: 11)),
                              Text(
                                "020 96794376",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ຊື່", style: TextStyle(fontSize: 11)),
                              Text("saiyvoud", style: TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 00.0),
                          child: Text(
                            'Total Amount',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '1800\$',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigatorWidget(),
                      ),
                    );
                  },
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.indigo.shade700,
                        width: 1.5,
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.indigo[700],
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
