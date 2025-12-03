import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/enums/order_status_enum.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this._ordersRepo) : super(UpdateOrderInitial());
  final OrdersRepo _ordersRepo;

  Future<void> updateOrder({
    required String orderId,
    required OrderStatusEnum status,
  }) async {
    emit(UpdateOrderLoading());
    var result = await _ordersRepo.updateOrder(
      orderId: orderId,
      status: status,
    );
    result.fold(
      (failure) => emit(UpdateOrderFailure(failure.message)),
      (success) => emit(UpdateOrderSuccess()),
    );
  }
}
