import 'package:flutter_test/flutter_test.dart';
import 'package:check_list_app/utils/function/function.dart';

void main() {
  group('dateTimeDiff', () {
    test('returns "just now" for a dateTime within a minute', () {
      final now = DateTime.now();
      expect(dateTimeDiff(now.subtract(Duration(seconds: 30))), 'just now');
    });

    test('returns "X minutes ago" for a dateTime within an hour', () {
      final now = DateTime.now();
      expect(dateTimeDiff(now.subtract(Duration(minutes: 5))), '5 minutes ago');
    });

    test('returns "X hours ago" for a dateTime within a day', () {
      final now = DateTime.now();
      expect(dateTimeDiff(now.subtract(Duration(hours: 3))), '3 hours ago');
    });

    test('returns "X days ago" for a dateTime more than a day ago', () {
      final now = DateTime.now();
      expect(dateTimeDiff(now.subtract(Duration(days: 2))), '2 days ago');
    });
  });
}
