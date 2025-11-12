import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_error_snack_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';

import 'add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildSnackBar(context, 'Product added successfully');
        }
        if (state is AddProductFailure) {
          buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
