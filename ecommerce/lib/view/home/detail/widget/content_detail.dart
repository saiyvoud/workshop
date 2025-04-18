import 'package:flutter/material.dart';

class ContentDetail extends StatefulWidget {
  const ContentDetail({super.key});

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  List<String> sizeData = ["250SSD", "520SSD", "1TB SSD"];
  int currentIndex = 0;
  onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 320,
          right: 0,
          left: 0,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("Name"),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "% On sale",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Text(
                    "The Microsoft Xbox Series X gaming console is capable of impressing with minimal boot times and mesmerizing visual effects when playing games at up to 120 frames per second",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      sizeData.map((item) {
                        final index = sizeData.indexOf(item);
                        return InkWell(
                          onTap: () {
                            onTap(index);
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color:
                                  currentIndex == index
                                      ? Colors.green
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  currentIndex == index
                                      ? Border.all(color: Colors.green)
                                      : Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(
                                  color:
                                      currentIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
