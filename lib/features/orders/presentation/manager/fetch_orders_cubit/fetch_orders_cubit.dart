import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this._ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo _ordersRepo;

  Future<void> fetchOrders() async {
    emit(FetchOrdersLoading());
    final result = await _ordersRepo.fetchOrders();
    result.fold(
      (failure) => emit(FetchOrdersFailure(failure.message)),
      (orders) => emit(FetchOrdersSuccess(orders)),
    );
  }
}
