import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;

  ConnectivityCubit({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity(),
        super(const ConnectivityInitial()) {
    _initConnectivityListener();
  }

  /// Initialize listener for connectivity changes
  void _initConnectivityListener() {
    _connectivity.onConnectivityChanged.listen((result) {
      _handleConnectivityChange(result);
    });

    // Check initial connectivity status
    _checkConnectivity();
  }

  /// Check current connectivity status
  Future<void> _checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _handleConnectivityChange(result);
    } catch (e) {
      emit(const ConnectivityOnline()); // Default to online on error
    }
  }

  /// Handle connectivity change and emit appropriate state
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    // Check if any connection type is available (excluding none)
    final isConnected = results.any(
      (result) =>
          result != ConnectivityResult.none &&
          result != ConnectivityResult.bluetooth,
    );

    if (isConnected) {
      emit(const ConnectivityOnline());
    } else {
      emit(const ConnectivityOffline());
    }
  }

  /// Check if app is currently online
  bool get isOnline => state is ConnectivityOnline;

  /// Check if app is currently offline
  bool get isOffline => state is ConnectivityOffline;
}
