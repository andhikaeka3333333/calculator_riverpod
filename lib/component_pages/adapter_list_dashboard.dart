import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/colors.dart';
import '../model/model_dashboard.dart';
import '../widgets/item_dashboard.dart';

class AdapterListDashboard extends StatelessWidget {
  final ModelDashboard modelDashboard;

  const AdapterListDashboard({super.key, required this.modelDashboard});

  @override
  Widget build(BuildContext context) {
    return ItemDashboard(
      title: modelDashboard.title,
      image: modelDashboard.image,
      iconData: modelDashboard.icon,
      iconColor: iconColor,
      iconSize: 75,
      containerHeight: 100,
      containerRadius: 25,
      containerColor: containerColor,
      mainAxisAlignment: MainAxisAlignment.center,
      marginRight: 20,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      onTap: () {
        context.push(modelDashboard.route); // Navigasi menggunakan GoRouter
      },
      marginTop: 20,
    );
  }
}
