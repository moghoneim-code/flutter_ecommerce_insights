import 'package:ecommerce_insights/core/utils/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MetricsSearchField extends StatelessWidget {
  const MetricsSearchField({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: const Icon(FontAwesomeIcons.search),
          filled: true,
          fillColor: AppColors.appLightBlueGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(),
          ),
        ),
        onTapOutside: (_)=> FocusScope.of(context).unfocus(),
      ),
    );
  }
}