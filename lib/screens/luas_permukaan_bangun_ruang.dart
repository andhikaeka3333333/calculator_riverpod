import 'package:calculator_riverpod/screens/keliling_bangun_datar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/luas_permukaan_logic.dart';
import '../widgets/main_button.dart';
import '../widgets/custom_input.dart';


class LuasPermukaanBangunRuang extends StatefulWidget {
  const LuasPermukaanBangunRuang({super.key});

  @override
  _LuasPermukaanBangunRuangState createState() => _LuasPermukaanBangunRuangState();
}

class _LuasPermukaanBangunRuangState extends State<LuasPermukaanBangunRuang> {
  final panjangBalokController = TextEditingController();
  final lebarBalokController = TextEditingController();
  final tinggiBalokController = TextEditingController();
  final rusukKubusController = TextEditingController();
  final jariJariBolaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Luas Permukaan Bangun Ruang"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balok',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              CustomInput(
                labelText: "Panjang",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: panjangBalokController,
                labelColor: Colors.black,
              ),
              SizedBox(height: 10),
              CustomInput(
                labelText: "Lebar",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: lebarBalokController,
                labelColor: Colors.black,
              ),
              SizedBox(height: 10),
              CustomInput(
                labelText: "Tinggi",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: tinggiBalokController,
                labelColor: Colors.black,
              ),
              SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MainButton(
                        textButton: "Hitung Luas Permukaan Balok",
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        radius: 5,
                        elevation: 5,
                        onPressed: () {
                          if (panjangBalokController.text.isEmpty ||
                              lebarBalokController.text.isEmpty ||
                              tinggiBalokController.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text('Inputan harus lengkap!'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            final panjang = double.tryParse(panjangBalokController.text) ?? 0;
                            final lebar = double.tryParse(lebarBalokController.text) ?? 0;
                            final tinggi = double.tryParse(tinggiBalokController.text) ?? 0;

                            ref.read(panjangBalokProvider.notifier).state = panjang;
                            ref.read(lebarBalokProvider.notifier).state = lebar;
                            ref.read(tinggiBalokProvider.notifier).state = tinggi;

                            ref.read(luasPermukaanBalokProvider.notifier).state;
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  final luasPermukaanBalok = ref.watch(luasPermukaanBalokProvider);
                  return Center(
                    child: Text('Luas Permukaan: $luasPermukaanBalok'),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Kubus',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              CustomInput(
                labelText: "Rusuk",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: rusukKubusController,
                labelColor: Colors.black,
              ),
              SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MainButton(
                        textButton: "Hitung Luas Permukaan Kubus",
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        radius: 5,
                        elevation: 5,
                        onPressed: () {
                          if (rusukKubusController.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text('Inputan harus lengkap!'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            final rusuk = double.tryParse(rusukKubusController.text) ?? 0;

                            ref.read(rusukKubusProvider.notifier).state = rusuk;

                            ref.read(luasPermukaanKubusProvider.notifier).state;
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  final luasPermukaanKubus = ref.watch(luasPermukaanKubusProvider);
                  return Center(
                    child: Text('Luas Permukaan: $luasPermukaanKubus'),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Bola',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              CustomInput(
                labelText: "Jari-Jari",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: jariJariBolaController,
                labelColor: Colors.black,
              ),
              SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MainButton(
                        textButton: "Hitung Luas Permukaan Bola",
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        radius: 5,
                        elevation: 5,
                        onPressed: () {
                          if (jariJariBolaController.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text('Inputan harus lengkap!'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            final jariJari = double.tryParse(jariJariBolaController.text) ?? 0;

                            ref.read(jariJariBolaProvider.notifier).state = jariJari;

                            ref.read(luasPermukaanBolaProvider.notifier).state;
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  final luasPermukaanBola = ref.watch(luasPermukaanBolaProvider);
                  return Center(
                    child: Text('Luas Permukaan: $luasPermukaanBola'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
