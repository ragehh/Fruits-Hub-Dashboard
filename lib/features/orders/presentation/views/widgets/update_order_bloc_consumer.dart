import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_error_snack_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';

class UpdateOrderBlocConsumer extends StatelessWidget {
  const UpdateOrderBlocConsumer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (BuildContext context, state) {
        if (state is UpdateOrderSuccess) {
          buildSnackBar(context, 'Order updated successfully.');
        }
        if (state is UpdateOrderFailure) {
          buildSnackBar(context, state.errorMassage);
        }
      },
      builder: (BuildContext context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
