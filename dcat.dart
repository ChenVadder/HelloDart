import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';

const lineNumber = 'line-number';

void main(List<String> args) {
  exitCode = 0;
  final parser = ArgParser()
    ..addFlag(lineNumber,
        negatable: false,
        abbr: 'n',
        help: 'Show line numbers',
        defaultsTo: false);

  ArgResults argResults = parser.parse(args);
  final files = argResults.rest;
  dcat(files, showLineNumbers: argResults[lineNumber] as bool);
  print('done.');
}

Future<void> dcat(paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty) {
    while (paths.isEmpty) {
      stdout.write('>>>');
      //print('>>>'); print会自动换行，裸输出不会换行
      //时间线不一定会有结果，“？”用于标志不一定有这个变量
      String? line = stdin.readLineSync();
      print('$line \n');
      //line后面的？表示这个对象可能为空
      if (line?.toLowerCase() == 'exit') {
        print('bye.');
        break;
      }
    }
  } else {
    for (final path in paths) {
      var lineNumber = 1;

      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());

      try {
        await for (final line in lines) {
          if (showLineNumbers) {
            print('${lineNumber++} $line'); //变量自增一
          } else {
            print(line);
          }
        }
      } catch (_) {
        await _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('Error: $path is a directory.');
  } else {
    exitCode = 2;
  }
}