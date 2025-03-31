import 'package:flutter/material.dart';
import 'package:note_daily/components/data.dart';
import 'package:note_daily/components/hive_database.dart';
import 'package:note_daily/components/messageHelper.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/home_view.dart';
import 'package:note_daily/view/widget/create_type.dart';
import 'package:provider/provider.dart';
import 'package:shortid/shortid.dart';

class AddFolder extends StatefulWidget {
  const AddFolder({super.key});

  @override
  State<AddFolder> createState() => _AddFolderState();
}

class _AddFolderState extends State<AddFolder> {
  final folder = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Folder",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateType(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    controller: folder,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "folder name is required!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(),
                      focusedErrorBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Folder name",
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        HiveDatabase().saveFolder(
                          folderID: shortid.generate(),
                          title: folder.text,
                          type: dataType[provider.currentIndex],
                        );
                        provider.getFolder(type: dataType[provider.currentIndex]);
                        MessageHelper.showMessage(true, "Save Folder Success");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
