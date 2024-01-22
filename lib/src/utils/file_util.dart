import 'dart:io';

import 'package:dan_utils/src/model/app_query.dart';

class FileUtil {
  static Future<String> readAsString(String filePath) async {
    File file = File(filePath);
    return await file.readAsString();
  }

  static Future<AppQuery?> readQuery(FileSystemEntity file) async {
    try {
      if (file is File && file.path.endsWith('.sql')) {
        String content = await FileUtil.readAsString(file.path);

        RegExp upQuery = RegExp(r'-- up\n(.*?)\n-- down', dotAll: true);
        RegExp downQuery = RegExp(r'-- down\n(.*?)$', dotAll: true);

        String upMatch = upQuery.firstMatch(content)?.group(1) ?? '';
        String downMatch = downQuery.firstMatch(content)?.group(1) ?? '';
        String fileName = file.path.split("/").last;
        return AppQuery(fileName: fileName, up: upMatch, down: downMatch);
      } else {
        throw Exception("The file is not a SQL script.");
      }
    } on Exception catch (e) {
      print("readQuery ${file.path} ${e.toString()}");
      return null;
    }
  }

  static Future<List<AppQuery>> readQueries(
      List<FileSystemEntity> files) async {
    try {
      if (files.isNotEmpty) {
        List<AppQuery> queries = [];
        files.sort((a, b) =>
            a.uri.pathSegments.last.compareTo(b.uri.pathSegments.last));
        for (var file in files) {
          AppQuery? appQuery = await FileUtil.readQuery(file);
          if (appQuery != null) queries.add(appQuery);
        }
        return queries;
      } else {
        Exception("Files does not exist.");
        return [];
      }
    } on Exception catch (e) {
      print("readQueries ${e.toString()}");
      return [];
    }
  }

  // * singleton
  static final FileUtil _i = FileUtil._internal();
  factory FileUtil() => _i;
  FileUtil._internal();
}
