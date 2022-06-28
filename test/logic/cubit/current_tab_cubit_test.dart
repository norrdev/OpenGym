import 'package:npng/logic/cubit/current_tab_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CurrentTabCubit', () {
    late CurrentTabCubit currentTabCubit;

    setUp(() {
      currentTabCubit = CurrentTabCubit();
    });

    tearDown(() {
      currentTabCubit.close();
    });

    test('initial state of CurrentTabCubit', () {
      expect(currentTabCubit.state, CurrentTabInitial());
    });

    blocTest('read from systemPrefs',
        build: () => currentTabCubit,
        act: (CurrentTabCubit cubit) async {
          cubit.loadCurrentIndex();
        },
        expect: () => [CurrentTabLoaded(0)]);
  });
}
