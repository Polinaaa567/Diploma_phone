import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardHoverProvider = StateProvider.family<bool, String>(
  (ref, cardKey) => false,
);
final cardPressedProvider = StateProvider.family<bool, String>(
  (ref, cardKey) => false,
);
