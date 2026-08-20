import 'dart:io';
import 'package:logging/logging.dart';

Logger initFileLogger(String name) {
  hierarchicalLoggingEnabled = true;
  final logger = Logger(name);
  final now = DateTime.now();

  final scriptFile = File(Platform.script.toFilePath());
  final projectDir = scriptFile.parent.parent.path;
  final dir = Directory('$projectDir/logs');

  if (!dir.existsSync()) {
    dir.createSync();
  }

  final date =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  final logFile = File('${dir.path}/${date}_$name.txt');

  logger.level = Level.ALL;

  logger.onRecord.listen((record) {
    final msg =
        '[${record.time} - ${record.loggerName}] '
        '${record.level.name}: ${record.message}';

    logFile.writeAsStringSync('$msg\n', mode: FileMode.append);
  });

  return logger;
}
