import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  setUp(() {
    Hive.init('database');
  });

  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('mg');
    await box.add('sad');
    expect(box.values.first, 'sad');
  });

  test('Name Box Create and Put', () async {
    final themeBox = await Hive.openBox<bool>('theme');
    await themeBox.put('theme', true);
    expect(themeBox.get('theme'), true);
  });

  test('Name Box Add List', () async {
    final box = await Hive.openBox<String>('melih');
    await box.clear();
    List<String> items = List.generate(100, (index) => '$index');
    await box.addAll(items);
    expect(box.values.first, '0');
  });

  test('Name Box Put Items', () async {
    final box = await Hive.openBox<String>('demos');
    List<MapEntry<String, String>> items = List.generate(
        100, (index) => MapEntry('$index - $index', 'hwa $index'));
    await box.putAll(Map.fromEntries(items));
    expect(box.get('99 - 99'), 'hwa 99');
  });
}
