part of 'lil_snack.dart';

/// Controller of LilSnack message.
final class _LilSnackController with EquatableMixin {
  /// Creates a controller of LilSnack message.
  _LilSnackController({
    required TickerProvider vsync,
    required VoidCallback onDispose,
    required LilSnackBase lilSnack,
  })  : _onDispose = onDispose,
        _lilSnack = lilSnack {
    _init(vsync: vsync, lilSnack: lilSnack);
  }

  /// Method that is called when this controller disposes.
  final VoidCallback _onDispose;

  /// Configuration of LilSnack message.
  final LilSnackBase _lilSnack;

  /// Entry of LilSnack message in overlay.
  late final _LilSnackEntry _lilSnackEntry;

  /// Controller of LilSnack message animation.
  late final AnimationController _animationController;

  /// [Completer] of this controller.
  Completer<_LilSnackClosedReason>? _completer;

  /// Timer for close LilSnack message.
  Timer? _timer;

  /// Whether LilSnack message is shown.
  bool _shown = false;

  /// Whether this controller is disposed.
  bool isDisposed = false;

  /// Shows LilSnack message.
  Future<void> show() {
    _shown = true;
    _timer = _setupTimer(
      _lilSnack.duration +
          _lilSnack.animationDuration +
          _lilSnack.reverseAnimationDuration,
    );
    return _animationController.forward();
  }

  /// Closes LilSnack message.
  void close(_LilSnackClosedReason reason) => _complete(reason);

  /// Initializes the controller.
  void _init({
    required TickerProvider vsync,
    required LilSnackBase lilSnack,
  }) {
    _completer = Completer<_LilSnackClosedReason>()..future.then(_onComplete);
    _lilSnackEntry = _createLilSnackEntry();
    _animationController = AnimationController(
      vsync: vsync,
      duration: lilSnack.animationDuration,
      reverseDuration: lilSnack.reverseAnimationDuration,
    );
  }

  /// Completes this controller.
  void _complete(_LilSnackClosedReason reason) {
    final completer = _completer;
    if (completer == null) return;
    final isCompleted = completer.isCompleted;
    if (!isCompleted) completer.complete(reason);
  }

  /// Callback that invokes when future of [_completer] completes.
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
  _LilSnackEntry _createLilSnackEntry() {
    final lilSnackMessage = switch (_lilSnack) {
      LilSnack() => _LilSnackMessage(
          onTap: _lilSnack.onTap,
          controller: this,
          spaceBetweenIconAndMessage: _lilSnack.spaceBetweenIconAndMessage,
          spaceBetweenMessageAndAction: _lilSnack.spaceBetweenMessageAndAction,
          externalPadding: _lilSnack.externalPadding,
          internalPadding: _lilSnack.internalPadding,
          dismissDirection: _lilSnack.dismissDirection,
          trailing: _lilSnack.trailing,
          type: _lilSnack.type,
          text: _lilSnack.text,
          maxLines: _lilSnack.maxLines,
          textAlign: _lilSnack.textAlign,
          textOverflow: _lilSnack.textOverflow,
          position: _lilSnack.position,
          showIcon: _lilSnack.showIcon,
          dismissible: _lilSnack.dismissible,
          animationBuilder: _lilSnack.animationBuilder,
          key: UniqueKey(),
        ),
      CustomLilSnack() => _CustomLilSnackMessage(
          onTap: _lilSnack.onTap,
          controller: this,
          position: _lilSnack.position,
          spaceBetweenIconAndMessage: _lilSnack.spaceBetweenIconAndMessage,
          spaceBetweenMessageAndAction: _lilSnack.spaceBetweenMessageAndAction,
          externalPadding: _lilSnack.externalPadding,
          internalPadding: _lilSnack.internalPadding,
          expandContent: _lilSnack.expandContent,
          dismissible: _lilSnack.dismissible,
          content: _lilSnack.content,
          trailing: _lilSnack.trailing,
          leading: _lilSnack.leading,
          decoration: _lilSnack.decoration,
          dismissDirection: _lilSnack.dismissDirection,
          animationBuilder: _lilSnack.animationBuilder,
          key: UniqueKey(),
        ),
      CustomChildLilSnack() => _CustomChildLilSnackMessage(
          onTap: _lilSnack.onTap,
          controller: this,
          position: _lilSnack.position,
          dismissible: _lilSnack.dismissible,
          dismissDirection: _lilSnack.dismissDirection,
          animationBuilder: _lilSnack.animationBuilder,
          key: UniqueKey(),
          child: _lilSnack.child,
        ),
    };

    return _LilSnackEntry(lilSnackMessage);
  }

  /// Cleans the resources of this controller.
  Future<void> dispose() async {
    _timer?.cancel();
    if (_shown) {
      _lilSnackEntry.remove();
      _shown = false;
    }
    _lilSnackEntry.dispose();
    _animationController.dispose();
    _completer = null;
    isDisposed = true;
    await Future<void>.delayed(_lilSnack.delayBeforeNextLilSnack);
    _onDispose();
  }

  /// Returns [_LilSnackEntry].
  _LilSnackEntry get lilSnackEntry => _lilSnackEntry;

  /// Returns animation controller of LilSnack message.
  AnimationController get animationController => _animationController;

  @override
  List<Object?> get props => [_lilSnack];
}
