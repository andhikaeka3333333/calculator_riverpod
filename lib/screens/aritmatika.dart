import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/calculate_button.dart';
import '../../widgets/custom_input.dart';

final angka1Provider = StateProvider<double>((ref) => 0);
final angka2Provider = StateProvider<double>((ref) => 0);
final operationProvider = StateProvider<String>((ref) => 'Penjumlahan');

final resultProvider = StateProvider<double>((ref) => 0);

class Aritmatika extends ConsumerWidget {
  const Aritmatika({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final angka1Controller = TextEditingController();
    final angka2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Aritmatika"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              labelText: "Angka Pertama",
              borderColor: Colors.black,
              focusedBorderColor: Colors.grey,
              inputType: TextInputType.number,
              controller: angka1Controller,
              labelColor: Colors.black,
            ),
            const SizedBox(height: 20),
            CustomInput(
              labelText: "Angka Kedua",
              borderColor: Colors.black,
              focusedBorderColor: Colors.grey,
              inputType: TextInputType.number,
              controller: angka2Controller,
              labelColor: Colors.black,
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, _) {
                final selectedOperation = ref.watch(operationProvider);
                return DropdownButton<String>(
                  value: selectedOperation,
                  onChanged: (String? newValue) {
                    ref.read(operationProvider.notifier).state = newValue!;
                  },
                  items: <String>[
                    'Penjumlahan',
                    'Pengurangan',
                    'Perkalian',
                    'Pembagian',
                    'Modulus'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, _) {
                return CalculateButton(
                  textButton: "Hitung",
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 5,
                  onPressed: () {
                    if (angka1Controller.text.isEmpty ||
                        angka2Controller.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Inputan harus lengkap!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final number1 =
                          double.tryParse(angka1Controller.text) ?? 0;
                      final number2 =
                          double.tryParse(angka2Controller.text) ?? 0;

                      final selectedOperation = ref.watch(operationProvider);

                      double result = 0;
                      switch (selectedOperation) {
                        case 'Penjumlahan':
                          result = number1 + number2;
                          break;
                        case 'Pengurangan':
                          result = number1 - number2;
                          break;
                        case 'Perkalian':
                          result = number1 * number2;
                          break;
                        case 'Pembagian':
                          result = number1 / number2;
                          break;
                        case 'Modulus':
                          result = number1 % number2;
                          break;
                      }

                      ref.read(resultProvider.notifier).state = result;
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, _) {
                final result = ref.watch(resultProvider);
                return Center(
                  child: Text(
                    'Hasil: $result',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
