import 'dart:async';
import 'package:flutter/foundation.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(
    Stream<dynamic> stream, {
    Listenable? additional,
  }) {
    _additional = additional;
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
    _additional?.addListener(notifyListeners);
  }

  late final StreamSubscription<dynamic> _subscription;
  Listenable? _additional;

  @override
  void dispose() {
    _additional?.removeListener(notifyListeners);
    _subscription.cancel();
    super.dispose();
  }
}
