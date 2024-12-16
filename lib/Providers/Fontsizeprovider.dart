import 'package:flutter_riverpod/flutter_riverpod.dart';

final FontSizeProvider = StateNotifierProvider<FontSizeNotifier, double>((ref) {
  return FontSizeNotifier();
});

class FontSizeNotifier extends StateNotifier<double> {
  FontSizeNotifier() : super(14.0);

  void setFontSize(double newSize) {
    state = newSize;
  }
}
