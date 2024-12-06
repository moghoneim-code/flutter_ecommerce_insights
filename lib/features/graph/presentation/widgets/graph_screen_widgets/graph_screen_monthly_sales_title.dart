import 'package:flutter/material.dart';


Widget graphScreenMonthlySalesTitle(String title){
   return  Align(
     alignment: Alignment.centerLeft,
     child: Container(
       margin: const EdgeInsets.all(8),
       padding: const EdgeInsets.all(8),
       decoration: BoxDecoration(
         color: Colors.white70,
         borderRadius: BorderRadius.circular(10),
       ),
       child:  Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )
         ),
     ),
   );
}