import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';

import '../../../../core/enums/order_status_enum.dart';
import '../../domain/entities/order_entity.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final String orderId;
  final String status;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json['totalPrice'],
    uId: json['uId'],
    orderId: json['orderId'],
    status: json['status'],
    shippingAddressModel: ShippingAddressModel.fromJson(
      json['shippingAddressModel'],
    ),
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((e) => OrderProductModel.fromJson(e)).toList(),
    ),
    paymentMethod: json['paymentMethod'],
  );

  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };

  toEntity() => OrderEntity(
    totalPrice: totalPrice,
    uId: uId,
    orderId: orderId,
    status: fetchEnum(),
    shippingAddressEntity: shippingAddressModel.toEntity(),
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
  );

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == status;
    });
  }
}
