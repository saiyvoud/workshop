import 'dart:io';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static BoxCollection? box;
  Future<BoxCollection?> initail() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      box = await BoxCollection.open(
        "db_note_daliy",
        {"test", "folders", "files"},
        path: directory.path,
      );
      return box;
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>?> getFiles({
    required String type,
  }) async {
    try {
      final fileBox = await Hive.openBox<Map>("files");
      final filteredFiles =
          fileBox.values.where((file) => file['type'] == type).toList();
      print("file $type  ===> $filteredFiles");
      return filteredFiles;
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>?> getFolder({
    required String type,
  }) async {
    try {
      final folderBox = await Hive.openBox<Map>("folders");
      final filteredFolders =
          folderBox.values.where((folder) => folder['type'] == type).toList();
      return filteredFolders;
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveFile({
    required String id,
    required String title,
    required String content,
    required String type,
  }) async {
    try {
      final fileBox = await Hive.openBox<Map>("files");
      await fileBox.add({
        "id": id,
        "title": title,
        "content": content,
        "type": type,
        "createdAt": DateTime.now().toLocal().toString(),
        "updatedAt": DateTime.now().toLocal().toString(),
      });
      return true;
    } catch (e) {
      print("Error Save File $e");
      return false;
    }
  }

  Future<bool> updateFile({
    required int index,
    required String id,
    required String title,
    required String content,
    required String type,
  }) async {
    try {
      final fileBox = await Hive.openBox<Map>("files");
      fileBox.values.where((file) => file['type'] == type).toList();
      await fileBox.putAt(index, {
        "id": id,
        "title": title,
        "content": content,
        "type": type,
        "createdAt": DateTime.now().toLocal().toString(),
        "updatedAt": DateTime.now().toLocal().toString(),
      });
      return true;
    } catch (e) {
      print("Error Update File $e");
      return false;
    }
  }

  Future<bool> deleteFile({
    required int index,
    required String type,
  }) async {
    try {
      final fileBox = await Hive.openBox<Map>("files");
      fileBox.values.where((file) => file['type'] == type).toList();
      fileBox.deleteAt(index);
      return true;
    } catch (e) {
      print("Error Delete File $e");
      return false;
    }
  }
   Future<bool> deleteFolder({
    required int index,
    required String type,
  }) async {
    try {
      final fileBox = await Hive.openBox<Map>("folders");
      fileBox.values.where((file) => file['type'] == type).toList();
      fileBox.deleteAt(index);
      return true;
    } catch (e) {
      print("Error Delete Folder $e");
      return false;
    }
  }

 Future<bool> deleteAll() async {
  try {
    // First, close all boxes completely
    await Hive.close();
    
    // Small delay to ensure everything is properly closed
    await Future.delayed(Duration(milliseconds: 100));
    
    // Now try to delete from disk
    await Hive.deleteBoxFromDisk('files');
    await Hive.deleteBoxFromDisk('folders');
    
    return true;
  } catch (e) {
    print("Error Delete All $e");
    
    // If standard approach fails, try more aggressive solution
    try {
      // Get the Hive home directory path
      final path = Hive.box('files').path;
      if (path != null) {
        final directory = Directory(path).parent;
        
        // Close Hive completely
        await Hive.close();
        
        // Delete the files manually if they exist
        final filesPath = '${directory.path}/files.hive';
        final filesFolderPath = '${directory.path}/folders.hive';
        
        if (await File(filesPath).exists()) {
          await File(filesPath).delete();
        }
        
        if (await File(filesFolderPath).exists()) {
          await File(filesFolderPath).delete();
        }
        
        return true;
      }
    } catch (e2) {
      print("Manual deletion failed: $e2");
    }
    
    return false;
  }
}
  Future<bool> saveFolder({
    required String folderID,
    required String title,
    required String type,
  }) async {
    try {
      final fileBox = await Hive.openBox<Map>("folders");
      await fileBox.add({
        "folderID": folderID,
        "title": title,
        "type": type,
        "createdAt": DateTime.now().toLocal().toString(),
        "updatedAt": DateTime.now().toLocal().toString(),
      });
      return true;
    } catch (e) {
      print("Error Save Folder $e");
      return false;
    }
  }

  Future<bool> saveTest({
    required String id,
    required String title,
    required String detail,
  }) async {
    try {
      final testBox = await box!.openBox('test');
      await testBox.put("data", {
        "id": id,
        "title": title,
        "detail": detail,
        "createdAt": DateTime.now().toString(),
        "updatedAt": DateTime.now().toString(),
      });
      final data = await testBox.get("data");
      print("data===> ${data}");
      return true;
    } catch (e) {
      return false;
    }
  }
}
