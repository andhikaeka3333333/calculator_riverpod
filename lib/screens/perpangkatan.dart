import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/perpangkatan_logic.dart';
import '../widgets/main_button.dart';
import '../widgets/custom_input.dart';



class Perpangkatan extends StatefulWidget {
  const Perpangkatan({super.key});

  @override
  _PerpangkatanState createState() => _PerpangkatanState();
}

class _PerpangkatanState extends State<Perpangkatan> {
  final bilanganPokokController = TextEditingController();
  final bilanganPangkatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perhitungan Bilangan Pangkat"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInput(
                labelText: "Bilangan Pokok",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: bilanganPokokController,
                labelColor: Colors.black,
              ),
              const SizedBox(height: 20),
              CustomInput(
                labelText: "Bilangan Pangkat",
                borderColor: Colors.black,
                focusedBorderColor: Colors.grey,
                inputType: TextInputType.number,
                controller: bilanganPangkatController,
                labelColor: Colors.black,
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, _) {
                  return MainButton(
                    textButton: "Hitung",
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    radius: 5,
                    elevation: 5,
                    onPressed: () {
                      if (bilanganPangkatController.text.isEmpty ||
                          bilanganPokokController.text.isEmpty) {
                        const snackBar = SnackBar(
                          content: Text('Inputan harus lengkap!'),
                        );
        
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final bilanganPokok =
                            double.tryParse(bilanganPokokController.text) ?? 0;
                        final bilanganPangkat =
                            double.tryParse(bilanganPangkatController.text) ?? 0;

                        ref.read(bilanganPangkatProvider.notifier).state = bilanganPangkat;
                        ref.read(bilanganPokokProvider.notifier).state = bilanganPokok;
        
                        ref.read(hasilPerpangkatanProvider.notifier).state;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, _) {
                  final hasilPerpangkatan = ref.watch(hasilPerpangkatanProvider);
                  return Center(
                    child: Text(
                      'Hasil: $hasilPerpangkatan',
                      style: const TextStyle(fontSize: 18),
                    ),
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

