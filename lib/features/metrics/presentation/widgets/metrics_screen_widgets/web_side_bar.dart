import 'package:flutter/material.dart';

import '../../../../../shared/models/order_model.dart';
import '../../../../graph/presentation/screens/graph_screen.dart';

Widget webSideBar(
    {required BuildContext context, required List<Order> orders}) {
  return Container(
    width: 250,
    color: Colors.grey[200],
    child: Column(
      children: [
        ListTile(
          title: const Text('View Orders Graph'),
          leading: const Icon(Icons.show_chart),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GraphScreen(orders: orders)));
          },
        ),
        const ListTile(
          title: Text('Products'),
          leading: Icon(Icons.shopping_bag),
        ),
        const ListTile(
          title: Text('Customers'),
          leading: Icon(Icons.people),
        ),
        const ListTile(
          title: Text('Reports'),
          leading: Icon(Icons.bar_chart),
        ),
        const ListTile(
          title: Text('Settings'),
          leading: Icon(Icons.settings),
        ),
      ],
    ),
  );
}
