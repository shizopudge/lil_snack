/// lil_snack package.
library lil_snack;

import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'lil_snack_animation.dart';
part 'lil_snack_closed_reason.dart';
part 'lil_snack_configurations.dart';
part 'lil_snack_constants.dart';
part 'lil_snack_controller.dart';
part 'lil_snack_entry.dart';
part 'lil_snack_messenger.dart';
part 'lil_snack_position.dart';
part 'lil_snack_theme.dart';
part 'lil_snack_type.dart';

/// Abstract base class for message widget.
@immutable
abstract base class _LilSnackMessageBase extends StatelessWidget {
  /// Providing a constant constructor for child classes.
  const _LilSnackMessageBase({required super.key});
}

/// Widget with a message.
@immutable
final class _LilSnackMessage extends _LilSnackMessageBase {
  /// Creates a widget with a message.
  const _LilSnackMessage({
    required this.onTap,
    required this.controller,
    required this.spaceBetweenIconAndMessage,
    required this.spaceBetweenMessageAndAction,
    required this.externalPadding,
    required this.internalPadding,
    required this.dismissDirection,
    required this.trailing,
    required this.type,
    required this.text,
    required this.maxLines,
    required this.textAlign,
    required this.textOverflow,
    required this.position,
    required this.showIcon,
    required this.dismissible,
    required this.animationBuilder,
    required super.key,
  }) : assert(
          type != LilSnackType.custom,
          'for custom message use another widget '
          '[_CustomLilSnackMessage] or [_CustomChildLilSnackMessage]',
        );

  /// Pressing handler.
  final VoidCallback? onTap;

  /// Controller of message.
  final _LilSnackController controller;

  /// Space between icon and message.
  final double spaceBetweenIconAndMessage;

  /// Space between message and action.
  final double spaceBetweenMessageAndAction;

  /// External padding.
  final EdgeInsetsGeometry externalPadding;

  /// Internal padding.
  final EdgeInsetsGeometry internalPadding;

  /// Dismiss direction.
  final DismissDirection? dismissDirection;

  /// Trailing widget.
  final Widget? trailing;

  /// Type of message.
  final LilSnackType type;

  /// The text that will be displayed by message.
  final String text;

  /// Max lines of text.
  final int maxLines;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Text overflow.
  final TextOverflow? textOverflow;

  /// Position of message.
  final LilSnackPosition position;

  /// Whether the icon should be displayed.
  final bool showIcon;

  /// Whether the message is dismissible.
  final bool dismissible;

  /// Function for build custom animation of message.
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  Widget build(BuildContext context) {
    final lilSnackTheme = Theme.of(context).extension<LilSnackTheme>();

    if (lilSnackTheme == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('LilSnackTheme was not found.'),
        ErrorDescription(
          '_LilSnackMessage requires a LilSnackTheme.',
        ),
        ErrorHint(
          'Typically, the LilSnackTheme is introduced by the MaterialApp '
          'theme at the top of your application widget tree.',
        ),
      ]);
    }

    late final Alignment alignment;
    var dismissDirection = this.dismissDirection;

    if (position == LilSnackPosition.top) {
      alignment = Alignment.topCenter;
      dismissDirection ??= DismissDirection.up;
    } else {
      alignment = Alignment.bottomCenter;
      dismissDirection ??= DismissDirection.down;
    }

    Widget? icon;

    if (showIcon) {
      final iconData = switch (type) {
        LilSnackType.success => lilSnackTheme.successIcon,
        LilSnackType.error => lilSnackTheme.errorIcon,
        LilSnackType.warning => lilSnackTheme.warningIcon,
        LilSnackType.notification => lilSnackTheme.notificationIcon,
        LilSnackType.custom => null,
      };

      if (iconData != null) {
        final iconColor = switch (type) {
          LilSnackType.success => lilSnackTheme.successIconColor,
          LilSnackType.error => lilSnackTheme.errorIconColor,
          LilSnackType.warning => lilSnackTheme.warningIconColor,
          LilSnackType.notification => lilSnackTheme.notificationIconColor,
          LilSnackType.custom => null,
        };

        if (iconColor == null) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary('iconColor not specified.'),
            ErrorDescription(
              '_LilSnackMessage requires the iconColor specified in the '
              'LilSnackTheme.',
            ),
            ErrorHint(
              'Typically, the iconColor is specified in the LilSnackTheme is '
              'introduced by the MaterialApp theme at the top of your '
              'application widget tree.',
            ),
          ]);
        }

        final iconSize = lilSnackTheme.iconSize;

        if (iconSize == null) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary('iconSize not specified.'),
            ErrorDescription(
              '_LilSnackMessage requires the iconSize specified in the '
              'LilSnackTheme.',
            ),
            ErrorHint(
              'Typically, the iconSize is specified in the LilSnackTheme is '
              'introduced by the MaterialApp theme at the top of your '
              'application widget tree.',
            ),
          ]);
        }

        icon = SizedBox.square(
          dimension: iconSize,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Icon(
              iconData,
              color: iconColor,
            ),
          ),
        );
      }
    }

    final textStyle = switch (type) {
      LilSnackType.success => lilSnackTheme.successTextStyle,
      LilSnackType.error => lilSnackTheme.errorTextStyle,
      LilSnackType.warning => lilSnackTheme.warningTextStyle,
      LilSnackType.notification => lilSnackTheme.notificationTextStyle,
      LilSnackType.custom => null,
    };

    if (textStyle == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('textStyle not specified.'),
        ErrorDescription(
          '_LilSnackMessage requires the textStyle specified in the '
          'LilSnackTheme.',
        ),
        ErrorHint(
          'Typically, the textStyle is specified in the LilSnackTheme is '
          'introduced by the MaterialApp theme at the top of your application '
          'widget tree.',
        ),
      ]);
    }

    final backgroundColor = switch (type) {
      LilSnackType.success => lilSnackTheme.successBackgroundColor,
      LilSnackType.error => lilSnackTheme.errorBackgroundColor,
      LilSnackType.warning => lilSnackTheme.warningBackgroundColor,
      LilSnackType.notification => lilSnackTheme.notificationBackgroundColor,
      LilSnackType.custom => null,
    };

    if (backgroundColor == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('backgroundColor not specified.'),
        ErrorDescription(
          '_LilSnackMessage requires the backgroundСolor specified in the '
          'LilSnackTheme.',
        ),
        ErrorHint(
          'Typically, the backgroundСolor is specified in the LilSnackTheme '
          'is introduced by the MaterialApp theme at the top of your '
          'application widget tree.',
        ),
      ]);
    }

    return _LilSnackMessageWrapper(
      onTap: onTap,
      controller: controller,
      dismissible: dismissible,
      alignment: alignment,
      dismissDirection: dismissDirection,
      position: position,
      animationBuilder: animationBuilder,
      key: key,
      child: SafeArea(
        child: Padding(
          padding: externalPadding,
          child: Material(
            type: MaterialType.transparency,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: lilSnackTheme.borderRadius,
                boxShadow: lilSnackTheme.boxShadow,
              ),
              child: Padding(
                padding: internalPadding,
                child: Row(
                  children: [
                    if (icon != null) ...[
                      icon,
                      SizedBox(width: spaceBetweenIconAndMessage),
                    ],
                    Expanded(
                      child: Text(
                        text,
                        maxLines: maxLines,
                        textAlign: textAlign,
                        overflow: textOverflow,
                        style: textStyle,
                      ),
                    ),
                    if (trailing != null) ...[
                      SizedBox(width: spaceBetweenMessageAndAction),
                      trailing!,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom widget with a message.
@immutable
final class _CustomLilSnackMessage extends _LilSnackMessageBase {
  /// Creates a custom widget with a message.
  const _CustomLilSnackMessage({
    required this.onTap,
    required this.controller,
    required this.spaceBetweenIconAndMessage,
    required this.spaceBetweenMessageAndAction,
    required this.externalPadding,
    required this.internalPadding,
    required this.dismissDirection,
    required this.leading,
    required this.content,
    required this.trailing,
    required this.position,
    required this.decoration,
    required this.expandContent,
    required this.dismissible,
    required this.animationBuilder,
    required super.key,
  });

  /// Pressing handler.
  final VoidCallback? onTap;

  /// Controller of message.
  final _LilSnackController controller;

  /// Space between icon and message.
  final double spaceBetweenIconAndMessage;

  /// Space between message and action.
  final double spaceBetweenMessageAndAction;

  /// External padding.
  final EdgeInsetsGeometry externalPadding;

  /// Internal padding.
  final EdgeInsetsGeometry internalPadding;

  /// Dismiss direction.
  final DismissDirection? dismissDirection;

  /// Leading widget.
  final Widget? leading;

  /// Content of widget.
  final Widget? content;

  /// Trailing widget.
  final Widget? trailing;

  /// Position of message.
  final LilSnackPosition position;

  /// Decoration of message.
  final Decoration decoration;

  /// Whether the [content] fills the entire width.
  final bool expandContent;

  /// Whether the message is dismissible.
  final bool dismissible;

  /// Function for build custom animation of message.
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  Widget build(BuildContext context) {
    late final Alignment alignment;
    var dismissDirection = this.dismissDirection;

    if (position == LilSnackPosition.top) {
      alignment = Alignment.topCenter;
      dismissDirection ??= DismissDirection.up;
    } else {
      alignment = Alignment.bottomCenter;
      dismissDirection ??= DismissDirection.down;
    }

    var content = this.content ?? const SizedBox.shrink();

    if (expandContent) content = Expanded(child: content);

    return _LilSnackMessageWrapper(
      onTap: onTap,
      controller: controller,
      dismissible: dismissible,
      alignment: alignment,
      dismissDirection: dismissDirection,
      position: position,
      animationBuilder: animationBuilder,
      key: key,
      child: SafeArea(
        child: Padding(
          padding: externalPadding,
          child: Material(
            type: MaterialType.transparency,
            child: DecoratedBox(
              decoration: decoration,
              child: Padding(
                padding: internalPadding,
                child: Row(
                  children: [
                    if (leading != null) ...[
                      leading!,
                      SizedBox(width: spaceBetweenIconAndMessage),
                    ],
                    content,
                    if (trailing != null) ...[
                      SizedBox(width: spaceBetweenMessageAndAction),
                      trailing!,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget with a custom child message.
@immutable
final class _CustomChildLilSnackMessage extends _LilSnackMessageBase {
  /// Creates a widget with a custom child message.
  const _CustomChildLilSnackMessage({
    required this.onTap,
    required this.controller,
    required this.dismissDirection,
    required this.child,
    required this.position,
    required this.dismissible,
    required this.animationBuilder,
    required super.key,
  });

  /// Pressing handler.
  final VoidCallback? onTap;

  /// Controller of message.
  final _LilSnackController controller;

  /// Dismiss direction.
  final DismissDirection? dismissDirection;

  /// Child widget.
  final Widget child;

  /// Position of message.
  final LilSnackPosition position;

  /// Whether the message is dismissible.
  final bool dismissible;

  /// Function for build custom animation of message.
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  Widget build(BuildContext context) {
    late final Alignment alignment;
    var dismissDirection = this.dismissDirection;

    if (position == LilSnackPosition.top) {
      alignment = Alignment.topCenter;
      dismissDirection ??= DismissDirection.up;
    } else {
      alignment = Alignment.bottomCenter;
      dismissDirection ??= DismissDirection.down;
    }

    return _LilSnackMessageWrapper(
      onTap: onTap,
      controller: controller,
      dismissible: dismissible,
      alignment: alignment,
      dismissDirection: dismissDirection,
      position: position,
      animationBuilder: animationBuilder,
      key: key,
      child: child,
    );
  }
}

/// Wrapper over LilSnack message.
@immutable
class _LilSnackMessageWrapper extends StatelessWidget {
  /// Creates a wrapper over LilSnack message.
  const _LilSnackMessageWrapper({
    required this.onTap,
    required this.controller,
    required this.dismissible,
    required this.alignment,
    required this.dismissDirection,
    required this.position,
    required this.animationBuilder,
    required this.child,
    required super.key,
  });

  /// Pressing handler.
  final VoidCallback? onTap;

  /// Controller of message.
  final _LilSnackController controller;

  /// Whether the message is dismissible.
  final bool dismissible;

  /// Alignment of message.
  final Alignment alignment;

  /// Dismiss direction.
  final DismissDirection dismissDirection;

  /// Position of message.
  final LilSnackPosition position;

  /// Function for build custom animation of message.
  final LilSnackAnimationBuilder? animationBuilder;

  /// Child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var child = this.child;

    if (dismissible) {
      child = Dismissible(
        key: key ?? UniqueKey(),
        onDismissed: (_) => controller.close(_LilSnackClosedReason.dismiss),
        direction: dismissDirection,
        child: child,
      );
    }

    if (onTap != null) {
      child = GestureDetector(
        onTap: onTap,
        child: child,
      );
    }

    child = animationBuilder?.call(
          context,
          child,
          controller.animationController.view,
        ) ??
        _DefaultLilSnackAnimation(
          animation: controller.animationController.view,
          position: position,
          child: child,
        );

    return Align(alignment: alignment, child: child);
  }
}
