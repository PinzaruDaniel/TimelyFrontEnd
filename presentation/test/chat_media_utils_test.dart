import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/pages/main_page/chat_page/chat_media_utils.dart';

void main() {
  test('formatMessageTimestamp formats month-day hour:minute', () {
    final input = DateTime(2025, 5, 1, 9, 3);
    final formatted = formatMessageTimestamp(input);
    expect(formatted, '05-01 09:03');
  });
}

