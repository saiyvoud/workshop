import 'package:flutter/material.dart';
import 'package:note_daily/components/hive_database.dart';

class HomeProvider extends ChangeNotifier {
  // ການສ້າງຕົວປ່ຽນ parameter ໃຊ້ພາຍໃນ
  int _currentIndex = 0;
  List<dynamic> _files = [];
  List<dynamic> _folders = [];
  bool _loading = false;
  // ການສົ່ງ parameter ອອກໄປໃຊ້
  int get currentIndex => _currentIndex;
  List<dynamic> get files => _files;
  List<dynamic> get folders => _folders;
  bool get loading => _loading;
  // ການສ້າງ function
  void onTap(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> getFiles({required String type}) async {
    _loading = true;
    try {
      _files.clear();
      final result = await HiveDatabase().getFiles(type: type);
      if (result!.length > 0) {
        _files = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
      print(e);
      rethrow;
    }
  }

  Future<void> getFolder({required String type}) async {
    _loading = true;
    try {
      _folders.clear();
      final result = await HiveDatabase().getFolder(type: type);
      if (result!.length > 0) {
        _folders = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      _loading = false;
      notifyListeners();
      rethrow;
    }
  }
}
