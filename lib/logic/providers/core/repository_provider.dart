import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository.dart';

final repositoryProvider = Provider<Repository>(
  (ref) => throw UnimplementedError('Repository provider must be overridden'),
);

Repository readRepository(BuildContext context) {
  return ProviderScope.containerOf(context, listen: false)
      .read(repositoryProvider);
}
