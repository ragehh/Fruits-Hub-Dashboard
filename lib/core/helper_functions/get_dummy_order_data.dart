import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

import '../enums/order_status_enum.dart';

OrderEntity getDummyOrderData() {
  // Create a sample shipping address
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    addressDetails: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl:
          'https://nwmgxqxazyjtzzcvwixh.supabase.co/storage/v1/object/public/fruits_bucket/images/33.png',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl:
          'https://nwmgxqxazyjtzzcvwixh.supabase.co/storage/v1/object/public/fruits_bucket/images/33.png',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl:
          'https://nwmgxqxazyjtzzcvwixh.supabase.co/storage/v1/object/public/fruits_bucket/images/33.png',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );

  // Create and return the OrderModel
  return OrderEntity(
    totalPrice: totalPrice,
    uId: 'user123',
    status: OrderStatusEnum.pending,
    shippingAddressEntity: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
}
