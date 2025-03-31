import 'package:flutter/material.dart';
import 'package:note_daily/components/hive_database.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/createfile/addfile.dart';
import 'package:note_daily/view/createfolder/addfolder.dart';
import 'package:note_daily/view/favorite/favorite_view.dart';
import 'package:note_daily/view/personal/personal_view.dart';
import 'package:note_daily/view/secret/secret_view.dart';
import 'package:note_daily/view/widget/creaate_file.dart';
import 'package:note_daily/view/widget/create_folder.dart';
import 'package:note_daily/view/widget/create_type.dart';
import 'package:note_daily/view/work/work_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _children = [
    WorkView(),
    PersonalView(),
    FavoriteView(),
    SecretView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.red,
        centerTitle: true,
        title: InkWell(
          onTap: (){
            HiveDatabase().deleteAll();
          },
          child: Text(
            "Note Daily",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CreateType(),
              _children[provider.currentIndex],
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddFile(),
                            ),
                          );
                        },
                        child: Text("Create File"),
                      ),
                      TextButton(
                        onPressed: () {
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddFolder(),
                            ),
                          );
                        },
                        child: Text("Create Folder"),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
