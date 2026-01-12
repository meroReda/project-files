import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ConnectivityState {}

class ConnectivityLoading extends ConnectivityState {}
class ConnectivityConnected extends ConnectivityState {
  final ConnectivityResult type;
  ConnectivityConnected({required this.type});
}

class ConnectivityDisconnected extends ConnectivityState {}

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription? _connectivitySubscription;
  ConnectivityCubit({Connectivity? connectivity}) : _connectivity = connectivity ?? Connectivity(), super(ConnectivityLoading()) {_init();}

  Future<void> _init() async {
    // الحصول على الحالة الأولية
    await checkConnectivity();
    // الاستماع للتغيرات في حالة الاتصال
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (result) {
        _updateState(result);
      },
    );
  }

  Future<void> checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateState(result);
    } catch (e) {
      emit(ConnectivityDisconnected());
    }
  }

  void _updateState(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(ConnectivityDisconnected());
    } else {
      emit(ConnectivityConnected(type: result));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
