import 'package:flutter/material.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/createfile/file_view.dart';
import 'package:note_daily/view/createfile/updatefile.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
   return Consumer<HomeProvider>(builder: (context, provider, child) {
    
       return provider.files.isEmpty && provider.folders.isEmpty
          ? Center(
              child: Text(
                "no data",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          : Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: provider.files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.file_copy,
                    color: Colors.grey,
                  ),
                  title: Text(
                    provider.files[index]['title'],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileView(
                                  title: provider.files[index]['title'],
                                  content: provider.files[index]['content'],
                                  index: index,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateFile(
                                  id: provider.files[index]['id'],
                                  index: index,
                                  title: provider.files[index]['title'],
                                  content: provider.files[index]['content'],
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit_document,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: provider.folders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.folder,
                    color: Colors.amber,
                  ),
                  title: Text(
                    provider.folders[index]['title'],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
        ],
      );
    });
  
  }
}