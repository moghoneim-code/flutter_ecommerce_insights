import 'package:flutter/material.dart';
import '../../../../../../core/utils/constants/colors/app_colors.dart';

PreferredSize graphScreenAppBar(BuildContext context ) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: AppColors.appLightGrey,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black),
        onPressed: () => Navigator.pop(context)),
    ),
  );
}
