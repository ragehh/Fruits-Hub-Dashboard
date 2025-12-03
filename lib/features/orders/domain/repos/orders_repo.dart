import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../../../core/enums/order_status_enum.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();

  Future<Either<Failure, void>> updateOrder({
    required String orderId,
    required OrderStatusEnum status,
  });
}
