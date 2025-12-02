import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item_widget.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({super.key, required this.orderItems});

  final List<OrderEntity> orderItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderEntity: orderItems[index]);
      },
    );
  }
}
