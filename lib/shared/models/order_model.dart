import 'dart:convert';

import 'package:ecommerce_insights/shared/extensions/convert_string_to_price.dart';



class Order {
  final String id;
  final bool isActive;
  final double  price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final OrderStatus status;
  final DateTime registered;

  Order({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    isActive: json["isActive"],
    price: json["price"].toString().toPrice(),
    company: json["company"],
    picture: json["picture"],
    buyer: json["buyer"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    status: statusValues.map[json["status"]]!,
    registered: DateTime.parse(json["registered"].toString()),
  );



  Map<String, dynamic> toJson() => {
    "id": id,
    "isActive": isActive,
    "price": price,
    "company": company,
    "picture": picture,
    "buyer": buyer,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "status": statusValues.reverse[status],
    "registered": registered,
  };


  static List<Order> parseOrders(String jsonStr) {
    final parsed = json.decode(jsonStr).cast<Map<String, dynamic>>();
    return parsed.map<Order>((json) => Order.fromJson(json)).toList();
  }
}


enum OrderStatus {
  DELIVERED,
  ORDERED,
  RETURNED,
}

final statusValues = EnumValues({
  "DELIVERED": OrderStatus.DELIVERED,
  "ORDERED": OrderStatus.ORDERED,
  "RETURNED": OrderStatus.RETURNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
