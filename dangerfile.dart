// @dart=2.10
import 'dart:io';

import 'package:path/path.dart' show join, current;
import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/danger_plugin_dart_test.dart';

void main() {
  if (danger.github == null) {
    message('Welcome to danger local');
  }

  if (danger.github?.pr?.title?.contains('WIP') == true) {
    warn('PR is considered WIP');
  }

  DangerPluginDartTest.processFile(
      File(join(current, 'danger_core_report.json')));
  DangerPluginDartTest.processFile(
      File(join(current, 'danger_dart_report.json')));
  DangerPluginDartTest.processFile(
      File(join(current, 'danger_plugin_dart_test_report.json')));
  DangerPluginDartTest.processFile(
      File(join(current, 'danger_plugin_golden_reporter.json')));
}
