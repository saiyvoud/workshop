import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<String> bannerData = [
    "assets/images/banner002.jpg",
    "assets/images/banner001.png",
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_banner(), _indicator()],
      ),
    );
  }

  _banner() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        viewportFraction: 1,
        disableCenter: true,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      items:
          bannerData.map((item) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(item, fit: BoxFit.cover),
              ),
            );
          }).toList(),
    );
  }

  _indicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            bannerData.map((url) {
              final index = bannerData.indexOf(url);
              return Container(
                width: 15,
                height: 5,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.green : Colors.grey,
                ),
              );
            }).toList(),
      ),
    );
  }
}
