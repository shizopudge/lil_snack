part of 'lil_snack.dart';

/// Controller of [_LilSnackMessage].
final class _LilSnackController {
  /// Creates controller of [_LilSnackMessage].
  _LilSnackController({
    required TickerProvider vsync,
    required VoidCallback onDispose,
    required LilSnack lilSnack,
  })  : _onDisposeCallback = onDispose,
        _lilSnack = lilSnack {
    _init(vsync: vsync, lilSnack: lilSnack);
  }

  /// Method that is called when [_LilSnackController] disposes.
  final VoidCallback _onDisposeCallback;

  /// Configuration of [_LilSnackMessage].
  final LilSnack _lilSnack;

  /// [Completer] of [_LilSnackController].
  late final Completer<_LilSnackClosedReason> _completer;

  /// Entry of [_LilSnackMessage] in overlay.
  late final _LilSnackEntry _lilSnackEntry;

  /// Controller of [_LilSnackMessage] animation.
  late final AnimationController _animationController;

  /// Timer for close [_LilSnackMessage].
  Timer? _timer;

  /// Whether [_LilSnackMessage] is shown.
  bool _shown = false;

  /// Whether [_LilSnackMessage] is disposed.
  bool isDisposed = false;

  /// Shows [_LilSnackMessage].
  Future<void> show() {
    _shown = true;
    _timer = _setupTimer(
      _lilSnack.duration +
          _lilSnack.animationDuration +
          _lilSnack.reverseAnimationDuration,
    );
    return _animationController.forward();
  }

  /// Closes [_LilSnackMessage].
  void close(_LilSnackClosedReason reason) => _complete(reason);

  /// Initializes the [_LilSnackController].
  void _init({
    required TickerProvider vsync,
    required LilSnack lilSnack,
  }) {
    _completer = Completer<_LilSnackClosedReason>()..future.then(_onComplete);
    _lilSnackEntry = _createLilSnackEntry();
    _animationController = AnimationController(
      vsync: vsync,
      duration: lilSnack.animationDuration,
      reverseDuration: lilSnack.reverseAnimationDuration,
    );
  }

  /// Completes [_LilSnackController].
  void _complete(_LilSnackClosedReason reason) {
    final isCompleted = _completer.isCompleted;
    if (!isCompleted) _completer.complete(reason);
  }

  /// Callback that invokes when [_completer] future completes.
  Future<void> _onComplete(_LilSnackClosedReason reason) async {
    final isDismissed = reason == _LilSnackClosedReason.dismiss;
    if (!isDismissed) await _animationController.reverse();
    unawaited(dispose());
  }

  /// Setups timer.
  Timer _setupTimer(Duration duration) => Timer(
        duration,
        () {
          _complete(_LilSnackClosedReason.timeout);
          _timer?.cancel();
        },
      );

  /// Creates [_LilSnackEntry].
  _LilSnackEntry _createLilSnackEntry() => _LilSnackEntry(
        _LilSnackMessage(
          text: _lilSnack.text,
          type: _lilSnack.type,
          controller: this,
          maxLines: _lilSnack.maxLines,
          position: _lilSnack.position,
          duration: _lilSnack.duration,
          animationDuration: _lilSnack.animationDuration,
          reverseAnimationDuration: _lilSnack.reverseAnimationDuration,
          spaceBetweenIconAndMessage: _lilSnack.spaceBetweenIconAndMessage,
          spaceBetweenMessageAndAction: _lilSnack.spaceBetweenMessageAndAction,
          externalPadding: _lilSnack.externalPadding,
          internalPadding: _lilSnack.internalPadding,
          expandContent: _lilSnack.expandContent,
          showIcon: _lilSnack.showIcon,
          dismissible: _lilSnack.dismissible,
          onTap: _lilSnack.onTap,
          content: _lilSnack.content,
          action: _lilSnack.action,
          icon: _lilSnack.icon,
          decoration: _lilSnack.decoration,
          textAlign: _lilSnack.textAlign,
          textOverflow: _lilSnack.textOverflow,
          dismissDirection: _lilSnack.dismissDirection,
          animationBuilder: _lilSnack.animationBuilder,
          key: UniqueKey(),
        ),
      );

  /// Cleans the resources of this controller.
  Future<void> dispose() async {
    _timer?.cancel();
    if (_shown) {
      _lilSnackEntry.remove();
      _shown = false;
    }
    _lilSnackEntry.dispose();
    _animationController.dispose();
    isDisposed = true;
    await Future<void>.delayed(_lilSnack.delayBeforeNextLilSnack);
    _onDisposeCallback();
  }

  /// Returns [_LilSnackEntry].
  _LilSnackEntry get lilSnackEntry => _lilSnackEntry;

  /// Returns animation controller of [_LilSnackMessage].
  AnimationController get animationController => _animationController;
}
