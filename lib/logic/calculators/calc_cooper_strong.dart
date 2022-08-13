import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

String cooperStrong({required BuildContext context, required int minutes}) {
  if (minutes < 3) {
    return S.of(context).cooperExcellent;
  } else if (minutes > 5) {
    return S.of(context).cooperBad;
  } else {
    return S.of(context).cooperAverage;
  }
}
