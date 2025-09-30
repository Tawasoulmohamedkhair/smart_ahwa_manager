import 'dart:developer';
import 'package:smart_ahwa_manager/domin/entities/order.dart';

abstract class IOrderRepository {
  void addOrder(Order order);
  List<Order> getPendingOrders();
  List<Order> getCompletedOrders();
  List<Order> getAllOrders();
}

class OrderRepository implements IOrderRepository {
  final List<Order> _orders = [];

  @override
  void addOrder(Order order) {
    _orders.add(order);
    log(
      'Order added to repository: ${order.customerName} - ${order.drinkType}',
    );
  }

  @override
  List<Order> getPendingOrders() =>
      _orders.where((pendorder) => !pendorder.isCompleted).toList();

  @override
  List<Order> getCompletedOrders() =>
      _orders.where((completeorder) => completeorder.isCompleted).toList();

  @override
  List<Order> getAllOrders() => _orders;
}
