import 'package:flutter/material.dart';

appbarHomeView() {
  return AppBar(
    backgroundColor: Colors.grey.shade300,
    leadingWidth: 100,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 1,
                right: 1,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ],
          ),
        ),
      ),
      Image.asset(
        'assets/icons/user.png',
        fit: BoxFit.cover,
      ),
      SizedBox(width: 10),
    ],
  );
}
