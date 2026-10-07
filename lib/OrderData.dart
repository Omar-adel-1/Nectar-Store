import 'package:flutter/foundation.dart';
import 'package:nectar_store/CartItam.dart';

class OrderModel {
  final String id;
  final DateTime date;
  final List<CartItem> items;
  final double total;

  OrderModel({
    required this.id,
    required this.date,
    required this.items,
    required this.total,
  });

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
}

class OrderData extends ChangeNotifier {
  OrderData._();
  static final OrderData instance = OrderData._();

  static List<OrderModel> get orders => instance._orders;
  final List<OrderModel> _orders = [];

  static OrderModel createOrder() {
    final order = OrderModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: DateTime.now(),
      items: CartData.snapshot(),
      total: CartData.totalPrice,
    );
    instance._orders.insert(0, order);
    instance.notifyListeners();
    return order;
  }
}
