import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this._ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo _ordersRepo;

  StreamSubscription? _streamSubscription;

  void fetchOrders() async {
    emit(FetchOrdersLoading());
    _streamSubscription = _ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders)),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
