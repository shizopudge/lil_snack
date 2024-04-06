part of 'lil_snack.dart';

/// Default animation of [_LilSnackMessage].
@immutable
class _DefaultLilSnackAnimation extends StatelessWidget {
  /// Creates a default animation of [_LilSnackMessage].
  const _DefaultLilSnackAnimation({
    required this.animation,
    required this.position,
    required this.child,
  });

  /// Animation for [_DefaultLilSnackAnimation].
  final Animation<double> animation;

  /// Position of [_LilSnackMessage].
  final LilSnackPosition position;

  /// Child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final beginOffset = switch (position) {
      LilSnackPosition.top => const Offset(0, -1),
      LilSnackPosition.bottom => const Offset(0, 1),
    };

    return FadeTransition(
      opacity: Tween<double>(begin: .5, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(.2, .8, curve: Curves.easeIn),
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
        ),
        child: child,
      ),
    );
  }
}
