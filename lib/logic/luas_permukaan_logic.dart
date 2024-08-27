import 'package:flutter_riverpod/flutter_riverpod.dart';

final rusukKubusProvider = StateProvider<double>((ref) => 0);

final panjangBalokProvider = StateProvider<double>((ref) => 0);
final lebarBalokProvider = StateProvider<double>((ref) => 0);
final tinggiBalokProvider = StateProvider<double>((ref) => 0);

final jariJariBolaProvider = StateProvider<double>((ref) => 0);

final luasPermukaanKubusProvider = StateProvider<double>((ref) {
  final rusuk = ref.watch(rusukKubusProvider);
  return 6 * rusuk * rusuk;
});

final luasPermukaanBalokProvider = StateProvider<double>((ref) {
  final panjang = ref.watch(panjangBalokProvider);
  final lebar = ref.watch(lebarBalokProvider);
  final tinggi = ref.watch(tinggiBalokProvider);
  return 2 * ((panjang * lebar) + (panjang * tinggi) + (lebar * tinggi));
});

final luasPermukaanBolaProvider = StateProvider<double>((ref) {
  final jariJari = ref.watch(jariJariBolaProvider);
  return 4 * 3.14 * jariJari * jariJari;
});
