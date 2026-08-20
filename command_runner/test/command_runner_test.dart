import 'package:command_runner/command_runner.dart';
import 'package:test/test.dart';

void main() {
  group('CommandRunner tests', () {
    test('CommandRunner can be created', () {
      final runner = CommandRunner();
      expect(runner, isNotNull);
    });
  });
}
