import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<String> bannerData = [
    "assets/images/logo.png",
    "assets/images/logo.png",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildBanner(), SizedBox(height: 10), _buildIndicator()],
    );
  }

  _buildBanner() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 200,
          viewportFraction: 1,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        items:
            bannerData.map((item) {
              return Center(child: Image.asset(item, fit: BoxFit.cover));
            }).toList(),
      ),
    );
  }

  _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          bannerData.map((url) {
            int index = bannerData.indexOf(url);
            return Container(
              width: 8,
              height: currentIndex == index ? 18 : 10,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape:
                    currentIndex == index ? BoxShape.circle : BoxShape.circle,
               // color: currentIndex == index ? Colors.green : Colors.grey,
               color: currentIndex == index ?  Colors.black : Colors.transparent
              ),
            );
          }).toList(),
    );
  }
}
