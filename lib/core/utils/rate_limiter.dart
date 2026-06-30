import 'dart:collection';

class RateLimiter {
  final int maxAttempts;
  final Duration window;
  final Queue<DateTime> _attempts = Queue<DateTime>();

  RateLimiter({required this.maxAttempts, this.window = const Duration(minutes: 1)});

  bool get isBlocked {
    _prune();
    return _attempts.length >= maxAttempts;
  }

  int get remainingAttempts {
    _prune();
    return maxAttempts - _attempts.length;
  }

  void recordAttempt() {
    _prune();
    _attempts.add(DateTime.now());
  }

  void reset() {
    _attempts.clear();
  }

  void _prune() {
    final cutoff = DateTime.now().subtract(window);
    while (_attempts.isNotEmpty && _attempts.first.isBefore(cutoff)) {
      _attempts.removeFirst();
    }
  }
}
