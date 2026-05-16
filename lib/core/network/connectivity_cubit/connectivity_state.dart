part of 'connectivity_cubit.dart';

/// Base class for connectivity states
abstract class ConnectivityState {
  const ConnectivityState();
}

/// Initial state when app starts
class ConnectivityInitial extends ConnectivityState {
  const ConnectivityInitial();
}

/// Connected to internet state
class ConnectivityOnline extends ConnectivityState {
  const ConnectivityOnline();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConnectivityOnline;
  }

  @override
  int get hashCode => 0;
}

/// Disconnected from internet state
class ConnectivityOffline extends ConnectivityState {
  const ConnectivityOffline();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConnectivityOffline;
  }

  @override
  int get hashCode => 1;
}
