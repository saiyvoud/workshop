import 'package:flutter/material.dart';
import 'package:note_daily/components/data.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CreateType extends StatefulWidget {
  const CreateType({super.key});

  @override
  State<CreateType> createState() => _CreateTypeState();
}

class _CreateTypeState extends State<CreateType> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.onTap(0);
                    provider.getFiles(type: dataType[0]); // type
                    provider.getFolder(type: dataType[0]); // type
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.folder,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Work",
                  style: TextStyle(color: Colors.black),
                ),
                provider.currentIndex == 0
                    ? Container(
                        height: 2,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.onTap(1);
                    provider.getFiles(type: dataType[1]); // type
                    provider.getFolder(type: dataType[1]); // type
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.folder_shared,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Personal",
                  style: TextStyle(color: Colors.black),
                ),
                provider.currentIndex == 1
                    ? Container(
                        height: 2,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.onTap(2);
                    provider.getFiles(type: dataType[2]); // type
                    provider.getFolder(type: dataType[2]); // type
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Favorite list",
                  style: TextStyle(color: Colors.black),
                ),
                provider.currentIndex == 2
                    ? Container(
                        height: 2,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.onTap(3);
                    provider.getFiles(type: dataType[3]); // type
                    provider.getFolder(type: dataType[3]); // type
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.security,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Secrete",
                  style: TextStyle(color: Colors.black),
                ),
                provider.currentIndex == 3
                    ? Container(
                        height: 2,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
