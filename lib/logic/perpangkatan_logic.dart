import 'package:calculator_riverpod/screens/perpangkatan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bilanganPokokProvider = StateProvider<double>((ref) => 0);
final bilanganPangkatProvider = StateProvider<double>((ref) => 0);

final hasilPerpangkatanProvider = StateProvider<double>((ref) {
  final bilanganPokok = ref.watch(bilanganPokokProvider);
  final bilanganPangkat = ref.watch(bilanganPangkatProvider);

  if (bilanganPokok == 0 || bilanganPangkat == 0) {
    return 0;
  }

  double hasil = 1;
  for (int i = 0; i < bilanganPangkat; i++) {
    hasil *= bilanganPokok;
  }
  return hasil;
});
