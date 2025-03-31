import 'package:flutter/material.dart';
import 'package:note_daily/components/data.dart';
import 'package:note_daily/components/hive_database.dart';
import 'package:note_daily/components/messageHelper.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/home_view.dart';
import 'package:note_daily/view/widget/create_type.dart';
import 'package:provider/provider.dart';
import 'package:shortid/shortid.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  final title = TextEditingController();
  final content = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add File",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context,provider,child) {
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
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      controller: title,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "filename is required!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(),
                        focusedErrorBorder: OutlineInputBorder(),
                        hintText: "File name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      controller: content,
                      maxLines: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "content is required!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(),
                        focusedErrorBorder: OutlineInputBorder(),
                        hintText: "content",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          HiveDatabase().saveFile(
                            id: shortid.generate(),
                            title: title.text,
                            content: content.text,
                            type: dataType[provider.currentIndex],
                          );
                          print(shortid.generate(),);
                          MessageHelper.showMessage(true, "Save File Success");
                          provider.getFiles(type: dataType[provider.currentIndex]);
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
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
        }
      ),
    );
  }
}
