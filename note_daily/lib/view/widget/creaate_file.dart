import 'package:flutter/material.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/createfile/file_view.dart';
import 'package:note_daily/view/createfile/updatefile.dart';
import 'package:note_daily/view/widget/create_folder.dart';
import 'package:provider/provider.dart';

class CreateFile extends StatefulWidget {
  const CreateFile({super.key});

  @override
  State<CreateFile> createState() => _CreateFileState();
}

class _CreateFileState extends State<CreateFile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Column(
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
          CreateFolder(),
        ],
      );
    });
  
  }
}
