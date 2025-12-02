import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_dummy_order_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const FilterSection(),
          const SizedBox(height: 16),
          OrderItemWidget(orderModel: getDummyOrder()),
        ],
      ),
    );
  }
}
