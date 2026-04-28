import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:npng/logic/providers/app_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('CurrentTabNotifier', () {
    late ProviderContainer container;
    late CurrentTabNotifier notifier;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
      notifier = container.read(currentTabProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is zero', () {
      expect(notifier.state, 0);
    });

    test('loads selected index from preferences', () async {
      SharedPreferences.setMockInitialValues(
        {CurrentTabNotifier.prefSelectedIndexKey: 3},
      );
      container.dispose();
      container = ProviderContainer();
      notifier = container.read(currentTabProvider.notifier);
      await notifier.loadCurrentIndex();
      expect(notifier.state, 3);
    });
  });
}
