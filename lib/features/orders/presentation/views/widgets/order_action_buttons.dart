import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/order_status_enum.dart';
import '../../../domain/entities/order_entity.dart';
import '../../manager/update_order_cubit/update_order_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (orderEntity.status == OrderStatusEnum.pending)
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.accepted,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Accept', style: TextStyle(color: Colors.green)),
          ),

        if (orderEntity.status == OrderStatusEnum.pending)
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.canceled,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),

        if (orderEntity.status == OrderStatusEnum.accepted)
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.delivered,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text(
              'Delivered',
              style: TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}
