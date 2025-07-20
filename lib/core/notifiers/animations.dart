import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animationControllerProvider = StateNotifierProvider.autoDispose
    .family<AnimationControllerNotifier, AnimationController, TickerProvider>(
        (ref, vsync) {
  return AnimationControllerNotifier(vsync);
});

class AnimationControllerNotifier extends StateNotifier<AnimationController> {
  AnimationControllerNotifier(TickerProvider vsync)
      : super(
          AnimationController(
            vsync: vsync,
            duration: const Duration(milliseconds: 800),
          ),
        ) {
    state.forward();
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
