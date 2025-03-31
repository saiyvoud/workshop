import 'package:flutter/material.dart';
import 'package:note_daily/components/data.dart';
import 'package:note_daily/components/messageHelper.dart';
import 'package:note_daily/provider/home_provider.dart';
import 'package:note_daily/view/home_view.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:note_daily/components/hive_database.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveDatabase().initail();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider()
            ..getFiles(type: dataType[0])
            ..getFolder(type: dataType[0]),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: MessageHelper.scaffoldMessengerKey,
      home: HomeView(),
    );
  }
}
