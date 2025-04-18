import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String> category = [
    "All",
    "Smartphones",
    "Headphone",
    "Laptop",
    "Iphone",
    "Ipad",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Categories", style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text("See all", style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: double.infinity,
          //decoration: BoxDecoration(color: Colors.red),
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border:
                          currentIndex == index
                              ? Border.all(color: Colors.white)
                              : Border.all(color: Colors.black,width: 2),
                    ),
                    child: Center(
                      child: Text(
                        category[index],
                        style: TextStyle(color: currentIndex == index? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
