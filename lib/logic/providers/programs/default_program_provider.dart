import 'package:flutter_riverpod/flutter_riverpod.dart';

final defaultProgramInitialProvider = Provider<int>((ref) => 0);

final defaultProgramProvider = NotifierProvider<DefaultProgramNotifier, int>(
  DefaultProgramNotifier.new,
);

class DefaultProgramNotifier extends Notifier<int> {
  @override
  int build() {
    return ref.watch(defaultProgramInitialProvider);
  }

  void setDefaultProgram(int defaultProgram) {
    state = defaultProgram;
  }
}
