import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_dummy_order_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'orders_view_body.dart';

class OrdersViewBodyBlocBuilder extends StatefulWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  State<OrdersViewBodyBlocBuilder> createState() =>
      _OrdersViewBodyBlocBuilderState();
}

class _OrdersViewBodyBlocBuilderState extends State<OrdersViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orderItems: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.errorMassage));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orderItems: [getDummyOrderData(), getDummyOrderData()],
            ),
          );
        }
      },
    );
  }
}
