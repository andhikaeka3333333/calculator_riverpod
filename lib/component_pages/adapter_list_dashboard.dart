import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/model_dashboard.dart';
import '../widgets/item_dashboard.dart';

class AdapterListDashboard extends StatelessWidget {
  final ModelDashboard modelDashboard;

  const AdapterListDashboard({super.key, required this.modelDashboard});

  @override
  Widget build(BuildContext context) {
    return ItemDashboard(title: modelDashboard.title,
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => modelDashboard.route!));
      }, marginTop: 20,);
  }
}



