import '../../data/repositories/order_repository.dart';

class DashboardService {
  final IOrderRepository _repository;

  DashboardService(this._repository);

  int getTotalOrders() => _repository.getAllOrders().length;

  Map<String, int> getTopSellingDrinks() {
    return _repository.getAllOrders().fold<Map<String, int>>({}, (map, order) {
      map[order.drinkType] = (map[order.drinkType] ?? 0) + 1;
      return map;
    });
  }
}
