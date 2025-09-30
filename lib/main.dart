import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/core/notification/app_notification.dart';
import 'package:smart_ahwa_manager/data/repositories/order_repository.dart';
import 'package:smart_ahwa_manager/domin/controllers/ahwa_manager_app.dart';
import 'package:smart_ahwa_manager/domin/usecases/dashboard_service.dart';
import 'package:smart_ahwa_manager/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = OrderRepository();
    final dashboard = DashboardService(repo);
    final notification = AppNotification();
    final appController = AhwaManagerApp(repo, dashboard, notification);

    return MaterialApp(
      title: 'Smart Ahwa Manager',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(appController: appController),
    );
  }
}
