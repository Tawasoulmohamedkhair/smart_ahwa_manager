import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/domin/controllers/ahwa_manager_app.dart';
import 'package:smart_ahwa_manager/domin/controllers/home_screen_controller.dart';
import 'package:smart_ahwa_manager/presentation/widget/custom_text_form_field.dart';
import 'package:smart_ahwa_manager/presentation/widget/pending_orders_list_home.dart';

class HomeScreen extends StatefulWidget {
  final AhwaManagerApp appController;

  const HomeScreen({super.key, required this.appController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _drinkController = TextEditingController();
  final TextEditingController _specialController = TextEditingController();

  late HomeScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeScreenController(
      appController: widget.appController,
      refreshUI: () => setState(() {}),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Ahwa Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormFields(
              title: 'Customer Name',
              controller: _nameController,
              hintText: 'EnterCustomer Name',
            ),

            CustomTextFormFields(
              title: 'Enter Drink Type',
              controller: _drinkController,
              hintText: 'Enter Drink Type',
            ),
            CustomTextFormFields(
              title: ' Special Instructions,',
              controller: _specialController,
              hintText: 'Enter Special Instructions',
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _controller.addOrder(
                _nameController,
                _drinkController,
                _specialController,
              ),
              child: const Text('Add Order'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _controller.goToDashboard,
              child: const Text('View Dashboard'),
            ),
            const Divider(height: 30),

            Text(
              'Pending Orders:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            PendingOrdersListHome(
              pendingOrders: widget.appController.getPendingOrders(),
              onComplete: _controller.completeOrder,
            ),
          ],
        ),
      ),
    );
  }
}
