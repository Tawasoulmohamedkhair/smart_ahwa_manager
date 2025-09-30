import 'package:smart_ahwa_manager/core/notification/app_notification.dart';
import 'package:smart_ahwa_manager/data/repositories/order_repository.dart';
import 'package:smart_ahwa_manager/domin/entities/order.dart';
import 'package:smart_ahwa_manager/domin/usecases/dashboard_service.dart';

class AhwaManagerApp {
  final IOrderRepository _repository;
  final DashboardService _dashboard;
  final NotificationService _notification;

  AhwaManagerApp(this._repository, this._dashboard, this._notification);

  void addOrder(Order order) {
    _repository.addOrder(order);
    _notification.send('New order: ${order.customerName} - ${order.drinkType}');
  }

  void completeOrder(Order order) {
    order.markCompleted();
    _notification.send('Completed order: ${order.customerName}');
  }

  List<Order> getPendingOrders() => _repository.getPendingOrders();
  List<Order> getCompletedOrders() => _repository.getCompletedOrders();
  int getTotalOrders() => _dashboard.getTotalOrders();
  Map<String, int> getTopDrinks() => _dashboard.getTopSellingDrinks();
  Map<String, int> getTopSellingDrinks() => _dashboard.getTopSellingDrinks();
}
