import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

import 'order_product_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final String orderId;
  final OrderStatusEnum status;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.status,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
