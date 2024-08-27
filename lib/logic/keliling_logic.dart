import 'package:flutter_riverpod/flutter_riverpod.dart';

final panjangProvider = StateProvider<double>((ref) => 0);
final lebarProvider = StateProvider<double>((ref) => 0);
final sisiProvider = StateProvider<double>((ref) => 0);
final jariJariProvider = StateProvider<double>((ref) => 0);

final kelilingPersegiPanjangProvider = StateProvider<double>((ref) {
  final panjang = ref.watch(panjangProvider);
  final lebar = ref.watch(lebarProvider);
  return 2 * (panjang + lebar);
});

final kelilingPersegiProvider = StateProvider<double>((ref) {
  final sisi = ref.watch(sisiProvider);
  return 4 * sisi;
});

final kelilingLingkaranProvider = StateProvider<double>((ref) {
  final jariJari = ref.watch(jariJariProvider);
  return 2 * 3.14 * jariJari;
});
