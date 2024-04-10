part of 'lil_snack.dart';

/// Scope of LilSnack feature.
@immutable
class LilSnackMessenger extends StatefulWidget {
  /// Creates a scope of LilSnack feature.
  const LilSnackMessenger({
    required this.child,
    super.key,
  });

  /// Child widget.
  final Widget child;

  /// Returns [LilSnackMessengerState] or throws [StateError].
  static LilSnackMessengerState of(BuildContext context) {
    final scope =
        context.getInheritedWidgetOfExactType<_InheritedLilSnackMessenger>();
    if (scope == null) {
      throw StateError(
        '[_InheritedLilSnackMessenger] was not found in the passed context.',
      );
    }
    return scope.state;
  }

  /// Returns [LilSnackMessengerState] or null.
  static LilSnackMessengerState? maybeOf(BuildContext context) => context
      .getInheritedWidgetOfExactType<_InheritedLilSnackMessenger>()
      ?.state;

  @override
  State<LilSnackMessenger> createState() => LilSnackMessengerState();
}

/// State of [LilSnackMessenger].
class LilSnackMessengerState extends State<LilSnackMessenger>
    with TickerProviderStateMixin {
  /// Queue of [_LilSnackController].
  late final Queue<_LilSnackController> _controllers;

  /// State of Overlay.
  late final OverlayState _overlayState;

  /// Controller of active LilSnack.
  _LilSnackController? _currentController;

  @override
  void initState() {
    super.initState();
    _controllers = Queue<_LilSnackController>();
    _overlayState = Overlay.of(context);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    _currentController?.dispose();
    _overlayState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _InheritedLilSnackMessenger(
        state: this,
        child: widget.child,
      );

  /// Adds message to queue.
  void show(LilSnackBase lilSnack) {
    final controller = _LilSnackController(
      vsync: this,
      onDispose: _upd,
      lilSnack: lilSnack,
    );
    if (lilSnack.unique && !_isUnique(controller)) return;
    _controllers.addLast(controller);
    _upd();
  }

  /// Hides current message.
  void hide() {
    if (_currentController != null) {
      _currentController?.close(_LilSnackClosedReason.hide);
      _currentController = null;
    }
  }

  /// Removes all messages.
  void removeAll() {
    if (_controllers.isNotEmpty) {
      for (final controller in _controllers) {
        controller.dispose();
      }
      _controllers.clear();
    }
    if (_currentController != null) {
      _currentController?.close(_LilSnackClosedReason.remove);
      _currentController = null;
    }
  }

  /// Updates messages.
  void _upd() {
    final isCurrentControllerDisposed = _currentController?.isDisposed ?? true;
    if (!isCurrentControllerDisposed) return;
    _currentController = null;
    if (_controllers.isEmpty) return;
    final controller = _controllers.removeFirst();
    _currentController = controller;
    _overlayState.insert(controller.lilSnackEntry);
    controller.show();
  }

  /// Returns true if the [controller] is unique.
  bool _isUnique(_LilSnackController controller) =>
      !_controllers.contains(controller) && _currentController != controller;
}

/// Widget that passes down the tree [LilSnackMessengerState].
@immutable
class _InheritedLilSnackMessenger extends InheritedWidget {
  /// Creates a widget that passes down the tree [LilSnackMessengerState].
  const _InheritedLilSnackMessenger({
    required this.state,
    required super.child,
  });

  /// State of [LilSnackMessenger].
  final LilSnackMessengerState state;

  @override
  bool updateShouldNotify(covariant _InheritedLilSnackMessenger oldWidget) =>
      oldWidget.state != state;
}
