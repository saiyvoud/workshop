import 'package:flutter/material.dart';
import 'package:note_daily/components/data.dart';
import 'package:note_daily/components/hive_database.dart';
import 'package:note_daily/components/messageHelper.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/home_view.dart';
import 'package:provider/provider.dart';

class FileView extends StatelessWidget {
  final String title;
  final int index;
  final String content;

  const FileView({
    super.key,
    required this.title,
    required this.content,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Consumer<HomeProvider>(builder: (context, provider, child) {
            return IconButton(
              onPressed: () {
                HiveDatabase().deleteFile(
                  index: index,
                  type: dataType[index],
                );
                MessageHelper.showMessage(true, "Delete File Success");
                provider.getFiles(
                  type: dataType[provider.currentIndex],
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
