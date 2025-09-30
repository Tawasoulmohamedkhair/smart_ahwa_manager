import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/domin/entities/order.dart';

class OrderCardList extends StatelessWidget {
  final String title;
  final List<Order>? orders;
  final int? count; 
  final Color? color;
  final bool showCompleteButton;
  final void Function(Order order)? onComplete;
  final IconData? icon; 

  const OrderCardList({
    super.key,
    required this.title,
    this.orders,
    this.count,
    this.color,
    this.showCompleteButton = false,
    this.onComplete,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: count != null
            ? Row(
                children: [
                  if (icon != null) Icon(icon, size: 40, color: Colors.blue),
                  if (icon != null) const SizedBox(width: 16),
                  Text(
                    '$title: $count',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title: ${orders?.length ?? 0}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...(orders ?? []).map(
                    (order) => ListTile(
                      title: Text('${order.customerName} - ${order.drinkType}'),
                      subtitle: order.specialInstructions.isNotEmpty
                          ? Text(order.specialInstructions)
                          : null,
                      trailing: showCompleteButton
                          ? IconButton(
                              icon: const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              onPressed: () => onComplete?.call(order),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
