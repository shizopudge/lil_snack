part of 'lil_snack.dart';

/// Type of function for build custom animation of LilSnack message.
typedef LilSnackAnimationBuilder = Widget Function(
  BuildContext context,
  Widget lilSnack,
  Animation<double> animation,
);

/// Abstract base class for configuration of LilSnack messages.
@immutable
sealed class LilSnackBase with EquatableMixin {
  /// Providing a constant constructor for child classes.
  const LilSnackBase();

  /// Position of message.
  LilSnackPosition get position;

  /// Duration of displaying message.
  Duration get duration;

  /// Duration of animation.
  Duration get animationDuration;

  /// Reverse duration of animation.
  Duration get reverseAnimationDuration;

  /// Delay before show of next message.
  Duration get delayBeforeNextLilSnack;

  /// Whether the message is dismissible.
  bool get dismissible;

  /// Whether the message is unique.
  ///
  /// To keep your message unique, add a key to the passed widgets, such as
  /// an action, content, icon or child. Otherwise, the message uniqueness
  /// check will not work correctly.
  bool get unique;

  /// Pressing handler.
  VoidCallback? get onTap;

  /// Dismiss direction.
  ///
  /// By default its would be [DismissDirection.up] if position ==
  /// [LilSnackPosition.top] and [DismissDirection.down] if position ==
  /// [LilSnackPosition.bottom].
  DismissDirection? get dismissDirection;

  /// Function for build custom animation of LilSnack message.
  LilSnackAnimationBuilder? get animationBuilder;
}

/// Configuration of [_LilSnackMessage].
@immutable
final class LilSnack extends LilSnackBase {
  /// Creates a configuration of [_LilSnackMessage].
  const LilSnack({
    required this.type,
    required this.text,
    this.maxLines = 5,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign,
    this.position = LilSnackPosition.top,
    this.duration = LilSnackConstants.defaultDuration,
    this.animationDuration = LilSnackConstants.defaultAnimationDuration,
    this.reverseAnimationDuration =
        LilSnackConstants.defaultReverseAnimationDuration,
    this.delayBeforeNextLilSnack =
        LilSnackConstants.defaultDelayBeforeNextLilSnack,
    this.spaceBetweenIconAndMessage = 8,
    this.spaceBetweenMessageAndAction = 8,
    this.externalPadding = const EdgeInsets.all(24),
    this.internalPadding = const EdgeInsets.all(20),
    this.showIcon = true,
    this.dismissible = true,
    this.unique = true,
    this.onTap,
    this.trailing,
    this.dismissDirection,
    this.animationBuilder,
  });

  @override
  final VoidCallback? onTap;

  /// Type of message.
  final LilSnackType type;

  /// The text that will be displayed by [_LilSnackMessage].
  final String text;

  /// Max lines of text.
  ///
  /// By default its 5.
  final int maxLines;

  /// Text overflow.
  ///
  /// By default its [TextOverflow.ellipsis].
  final TextOverflow? textOverflow;

  /// Text alignment.
  final TextAlign? textAlign;

  @override
  final LilSnackPosition position;

  @override
  final Duration duration;

  @override
  final Duration animationDuration;

  @override
  final Duration reverseAnimationDuration;

  @override
  final Duration delayBeforeNextLilSnack;

  /// Space between icon and message.
  ///
  /// By default its 8.
  final double spaceBetweenIconAndMessage;

  /// Space between message and action.
  ///
  /// By default its 8.
  final double spaceBetweenMessageAndAction;

  /// External padding.
  ///
  /// By default its EdgeInsets.all(24).
  final EdgeInsetsGeometry externalPadding;

  /// Internal padding.
  ///
  /// By default its EdgeInsets.all(20).
  final EdgeInsetsGeometry internalPadding;

  /// Whether the icon should be displayed.
  ///
  /// By default its true.
  final bool showIcon;

  @override
  final bool dismissible;

  @override
  final bool unique;

  /// Trailing widget.
  final Widget? trailing;

  @override
  final DismissDirection? dismissDirection;

  @override
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  List<Object?> get props => [
        type,
        text,
        maxLines,
        textOverflow,
        position,
        duration,
        animationDuration,
        reverseAnimationDuration,
        delayBeforeNextLilSnack,
        spaceBetweenIconAndMessage,
        spaceBetweenMessageAndAction,
        externalPadding,
        internalPadding,
        showIcon,
        dismissible,
        unique,
        trailing?.key,
        textAlign,
        dismissDirection,
      ];
}

/// Configuration of [_CustomLilSnackMessage].
@immutable
final class CustomLilSnack extends LilSnackBase {
  /// Creates a configuration of [_CustomLilSnackMessage].
  const CustomLilSnack({
    required this.decoration,
    this.onTap,
    this.position = LilSnackPosition.top,
    this.duration = LilSnackConstants.defaultDuration,
    this.animationDuration = LilSnackConstants.defaultAnimationDuration,
    this.reverseAnimationDuration =
        LilSnackConstants.defaultReverseAnimationDuration,
    this.delayBeforeNextLilSnack =
        LilSnackConstants.defaultDelayBeforeNextLilSnack,
    this.spaceBetweenIconAndMessage = 8,
    this.spaceBetweenMessageAndAction = 8,
    this.externalPadding = const EdgeInsets.all(24),
    this.internalPadding = const EdgeInsets.all(20),
    this.expandContent = true,
    this.dismissible = true,
    this.unique = true,
    this.leading,
    this.content,
    this.trailing,
    this.dismissDirection,
    this.animationBuilder,
  });

  @override
  final VoidCallback? onTap;

  @override
  final LilSnackPosition position;

  @override
  final Duration duration;

  @override
  final Duration animationDuration;

  @override
  final Duration reverseAnimationDuration;

  @override
  final Duration delayBeforeNextLilSnack;

  /// Space between icon and message.
  ///
  /// By default its 8.
  final double spaceBetweenIconAndMessage;

  /// Space between message and action.
  ///
  /// By default its 8.
  final double spaceBetweenMessageAndAction;

  /// External padding.
  ///
  /// By default its EdgeInsets.all(24).
  final EdgeInsetsGeometry externalPadding;

  /// Internal padding.
  ///
  /// By default its EdgeInsets.all(20).
  final EdgeInsetsGeometry internalPadding;

  /// Whether the [content] fills the entire width.
  ///
  /// By default its true.
  final bool expandContent;

  @override
  final bool dismissible;

  @override
  final bool unique;

  /// Leading widget.
  final Widget? leading;

  /// Content of widget.
  final Widget? content;

  /// Trailing widget.
  final Widget? trailing;

  /// Decoration of message.
  final Decoration decoration;

  @override
  final DismissDirection? dismissDirection;

  @override
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  List<Object?> get props => [
        position,
        duration,
        animationDuration,
        reverseAnimationDuration,
        delayBeforeNextLilSnack,
        spaceBetweenIconAndMessage,
        spaceBetweenMessageAndAction,
        externalPadding,
        internalPadding,
        expandContent,
        dismissible,
        unique,
        leading?.key,
        content?.key,
        trailing?.key,
        decoration,
        dismissDirection,
      ];
}

/// Configuration of [_CustomChildLilSnackMessage].
@immutable
final class CustomChildLilSnack extends LilSnackBase {
  /// Creates a configuration of [_CustomChildLilSnackMessage].
  const CustomChildLilSnack({
    required this.child,
    this.onTap,
    this.position = LilSnackPosition.top,
    this.duration = LilSnackConstants.defaultDuration,
    this.animationDuration = LilSnackConstants.defaultAnimationDuration,
    this.reverseAnimationDuration =
        LilSnackConstants.defaultReverseAnimationDuration,
    this.delayBeforeNextLilSnack =
        LilSnackConstants.defaultDelayBeforeNextLilSnack,
    this.dismissible = true,
    this.unique = true,
    this.dismissDirection,
    this.animationBuilder,
  });

  @override
  final VoidCallback? onTap;

  @override
  final LilSnackPosition position;

  @override
  final Duration duration;

  @override
  final Duration animationDuration;

  @override
  final Duration reverseAnimationDuration;

  @override
  final Duration delayBeforeNextLilSnack;

  @override
  final bool dismissible;

  @override
  final bool unique;

  /// Child widget.
  final Widget child;

  @override
  final DismissDirection? dismissDirection;

  @override
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  List<Object?> get props => [
        position,
        duration,
        animationDuration,
        reverseAnimationDuration,
        delayBeforeNextLilSnack,
        dismissible,
        unique,
        child.key,
        dismissDirection,
      ];
}
