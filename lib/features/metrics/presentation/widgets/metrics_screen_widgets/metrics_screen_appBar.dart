import 'package:ecommerce_insights/shared/use_cases/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/constants/colors/app_colors.dart';

PreferredSize metricsScreenAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: AppColors.appLightGrey,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => showDisplayToast(message: 'You Just Clicked The Menu Icon')),
      actions: [
        IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon:  const Icon(FontAwesomeIcons.bell, color: Colors.black
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
