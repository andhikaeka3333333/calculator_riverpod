import 'package:calculator_riverpod/screens/aritmatika.dart';
import 'package:calculator_riverpod/screens/keliling_bangun_datar.dart';
import 'package:calculator_riverpod/screens/luas_permukaan_bangun_ruang.dart';
import 'package:calculator_riverpod/screens/perpangkatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component_pages/adapter_list_dashboard.dart';
import 'model/model_dashboard.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModelDashboard> dataDashboard = [
      ModelDashboard("Kalkulator Aritmatika", null, Icons.calculate, '/aritmatika'),
      ModelDashboard("Keliling Bangun Datar", null, Icons.circle_rounded, '/keliling-bangun-datar'),
      ModelDashboard("Keliling Bangun Ruang", "images/kubus.png", null, '/luas-permukaan-bangun-ruang'),
      ModelDashboard("Bilangan Pangkat", "images/bilanganpangkat.png", null, '/perpangkatan'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Kalkulator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dataDashboard.length,
          itemBuilder: (context, index) {
            return AdapterListDashboard(modelDashboard: dataDashboard[index]);
          },
        ),
      ),
    );
  }
}
