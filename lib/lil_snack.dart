/// lil_snack package.
library lil_snack;

import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';

part 'lil_snack_animation.dart';
part 'lil_snack_closed_reason.dart';
part 'lil_snack_constants.dart';
part 'lil_snack_controller.dart';
part 'lil_snack_entry.dart';
part 'lil_snack_messenger.dart';
part 'lil_snack_position.dart';
part 'lil_snack_theme_extension.dart';
part 'lil_snack_type.dart';

/// Type of function for build custom animation of [_LilSnackMessage].
typedef LilSnackAnimationBuilder = Widget Function(
  BuildContext context,
  Widget lilSnack,
  Animation<double> animation,
);

/// Configuration of [_LilSnackMessage].
@immutable
final class LilSnack {
  /// Creates a configuration of [_LilSnackMessage].
  const LilSnack({
    required this.type,
    this.text = '',
    this.maxLines = 5,
    this.textOverflow = TextOverflow.ellipsis,
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
    this.showIcon = true,
    this.dismissible = true,
    this.onTap,
    this.content,
    this.action,
    this.icon,
    this.decoration,
    this.textAlign,
    this.dismissDirection,
    this.animationBuilder,
  });

  /// Type of [_LilSnackMessage].
  final LilSnackType type;

  /// The text that will be displayed by [_LilSnackMessage].
  ///
  /// By default its empty.
  final String text;

  /// Max lines of text.
  ///
  /// By default its 5.
  final int maxLines;

  /// Text overflow.
  ///
  /// By default its [TextOverflow.ellipsis].
  final TextOverflow? textOverflow;

  /// Position of [_LilSnackMessage].
  final LilSnackPosition position;

  /// Duration of displaying [_LilSnackMessage].
  final Duration duration;

  /// Duration of animation.
  final Duration animationDuration;

  /// Reverse duration of animation.
  final Duration reverseAnimationDuration;

  /// Delay before show of next [LilSnack].
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

  /// Whether the leading icon should be displayed.
  ///
  /// By default its true.
  final bool showIcon;

  /// Whether the [_LilSnackMessage] is dismissible.
  ///
  /// By default its true.
  final bool dismissible;

  /// Pressing handler.
  final VoidCallback? onTap;

  /// Content of widget.
  ///
  /// By default it would be [Text] configured by theme.
  final Widget? content;

  /// Action widget.
  final Widget? action;

  /// Leading icon widget.
  ///
  /// By default it would be icon configured by theme.
  final Widget? icon;

  /// Decoration of [_LilSnackMessage].
  ///
  /// By default it would be decoration configured by theme.
  final Decoration? decoration;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Dismiss direction.
  ///
  /// By default its would be [DismissDirection.up] if position ==
  /// [LilSnackPosition.top] and [DismissDirection.down] if position ==
  /// [LilSnackPosition.bottom].
  final DismissDirection? dismissDirection;

  /// Type of function for build custom animation of [_LilSnackMessage].
  final LilSnackAnimationBuilder? animationBuilder;
}

/// Widget with a message.
@immutable
class _LilSnackMessage extends StatelessWidget {
  /// Creates a widget with a message.
  const _LilSnackMessage({
    required this.text,
    required this.type,
    required this.controller,
    required this.maxLines,
    required this.position,
    required this.duration,
    required this.animationDuration,
    required this.reverseAnimationDuration,
    required this.spaceBetweenIconAndMessage,
    required this.spaceBetweenMessageAndAction,
    required this.externalPadding,
    required this.internalPadding,
    required this.expandContent,
    required this.showIcon,
    required this.dismissible,
    required this.onTap,
    required this.content,
    required this.action,
    required this.icon,
    required this.decoration,
    required this.textAlign,
    required this.textOverflow,
    required this.dismissDirection,
    required this.animationBuilder,
    required super.key,
  });

  /// Type of [_LilSnackMessage].
  final LilSnackType type;

  /// The text that will be displayed by [_LilSnackMessage].
  ///
  /// By default its empty.
  final String text;

  /// Controller of [_LilSnackMessage].
  final _LilSnackController controller;

  /// Max lines of text.
  ///
  /// By default its 5.
  final int maxLines;

  /// Position of [_LilSnackMessage].
  final LilSnackPosition position;

  /// Duration of displaying [_LilSnackMessage].
  final Duration duration;

  /// Duration of animation.
  final Duration animationDuration;

  /// Reverse duration of animation.
  final Duration reverseAnimationDuration;

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

  /// Whether the leading icon should be displayed.
  ///
  /// By default its true.
  final bool showIcon;

  /// Whether the [_LilSnackMessage] is dismissible.
  ///
  /// By default its true.
  final bool dismissible;

  /// Pressing handler.
  final VoidCallback? onTap;

  /// Content of widget.
  ///
  /// By default it would be [Text] configured by theme.
  final Widget? content;

  /// Action widget.
  final Widget? action;

  /// Leading icon widget.
  ///
  /// By default it would be icon configured by theme.
  final Widget? icon;

  /// Decoration of [_LilSnackMessage].
  ///
  /// By default it would be decoration configured by theme.
  final Decoration? decoration;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Text overflow.
  final TextOverflow? textOverflow;

  /// Dismiss direction.
  ///
  /// By default its would be [DismissDirection.up] if position ==
  /// [LilSnackPosition.top] and [DismissDirection.down] if position ==
  /// [LilSnackPosition.bottom].
  final DismissDirection? dismissDirection;

  /// Type of function for build custom animation of [_LilSnackMessage].
  final LilSnackAnimationBuilder? animationBuilder;

  @override
  Widget build(BuildContext context) {
    final lilSnackThemeData =
        Theme.of(context).extension<LilSnackThemeExtension>();

    if (lilSnackThemeData == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('LilSnackThemeData was not found.'),
        ErrorDescription(
          '_LilSnack requires a LilSnackThemeData.',
        ),
        ErrorHint(
          'Typically, the LilSnackThemeData is introduced by the MaterialApp '
          'theme at the top of your application widget tree.',
        ),
      ]);
    }

    final backgroundColor = switch (type) {
      LilSnackType.success => lilSnackThemeData.successBackgroundColor,
      LilSnackType.error => lilSnackThemeData.errorBackgroundColor,
      LilSnackType.warning => lilSnackThemeData.warningBackgroundColor,
      LilSnackType.notification =>
        lilSnackThemeData.notificationBackgroundColor,
      LilSnackType.custom => null,
    };

    if (type != LilSnackType.custom && backgroundColor == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('backgroundColor not specified.'),
        ErrorDescription(
          '_LilSnack requires the backgroundСolor specified in the '
          'LilSnackThemeData.',
        ),
        ErrorHint(
          'backgroundСolor is specified in the LilSnackThemeData is introduced '
          'by the MaterialApp theme at the top of your application widget '
          'tree.',
        ),
      ]);
    }

    final iconColor = switch (type) {
      LilSnackType.success => lilSnackThemeData.successIconColor,
      LilSnackType.error => lilSnackThemeData.errorIconColor,
      LilSnackType.warning => lilSnackThemeData.warningIconColor,
      LilSnackType.notification => lilSnackThemeData.notificationIconColor,
      LilSnackType.custom => null,
    };

    if (type != LilSnackType.custom && iconColor == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('iconColor not specified.'),
        ErrorDescription(
          '_LilSnack requires the iconColor specified in the '
          'LilSnackThemeData.',
        ),
        ErrorHint(
          'iconColor is specified in the LilSnackThemeData is introduced '
          'by the MaterialApp theme at the top of your application widget '
          'tree.',
        ),
      ]);
    }

    final textStyle = switch (type) {
      LilSnackType.success => lilSnackThemeData.successTextStyle,
      LilSnackType.error => lilSnackThemeData.errorTextStyle,
      LilSnackType.warning => lilSnackThemeData.warningTextStyle,
      LilSnackType.notification => lilSnackThemeData.notificationTextStyle,
      LilSnackType.custom => null,
    };

    if (type != LilSnackType.custom && textStyle == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('textStyle not specified.'),
        ErrorDescription(
          '_LilSnack requires the textStyle specified in the '
          'LilSnackThemeData.',
        ),
        ErrorHint(
          'textStyle is specified in the LilSnackThemeData is introduced '
          'by the MaterialApp theme at the top of your application widget '
          'tree.',
        ),
      ]);
    }

    final iconSize = lilSnackThemeData.iconSize;
    var dismissDirection = this.dismissDirection;
    late final Alignment alignment;

    if (position == LilSnackPosition.top) {
      alignment = Alignment.topCenter;
      dismissDirection ??= DismissDirection.up;
    } else {
      alignment = Alignment.bottomCenter;
      dismissDirection ??= DismissDirection.down;
    }

    Widget? icon;

    if (this.icon != null) {
      icon = this.icon;
    } else {
      final iconByType = switch (type) {
        LilSnackType.success => const Icon(Icons.check_circle_rounded),
        LilSnackType.error => const Icon(Icons.error_rounded),
        LilSnackType.warning => const Icon(Icons.warning_rounded),
        LilSnackType.notification => const Icon(Icons.notifications_rounded),
        LilSnackType.custom => null,
      };

      if (iconByType != null) {
        icon = ColorFiltered(
          colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
          child: SizedBox.square(
            dimension: iconSize,
            child: FittedBox(
              fit: BoxFit.cover,
              child: iconByType,
            ),
          ),
        );
      }
    }

    late final Widget content;

    if (this.content != null && expandContent) {
      content = Expanded(child: this.content!);
    } else if (this.content != null) {
      content = this.content!;
    } else {
      content = Expanded(
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: textOverflow,
          style: textStyle,
        ),
      );
    }

    Widget lilSnack = SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: DecoratedBox(
          decoration: decoration ??
              BoxDecoration(
                color: backgroundColor,
                borderRadius: lilSnackThemeData.borderRadius,
                boxShadow: lilSnackThemeData.boxShadow,
              ),
          child: Padding(
            padding: internalPadding,
            child: Row(
              children: [
                if (showIcon && icon != null) ...[
                  icon,
                  SizedBox(width: spaceBetweenIconAndMessage),
                ],
                content,
                if (action != null) ...[
                  SizedBox(width: spaceBetweenMessageAndAction),
                  action!,
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (dismissible) {
      lilSnack = Dismissible(
        key: key ?? UniqueKey(),
        onDismissed: (_) => controller.close(_LilSnackClosedReason.dismiss),
        direction: dismissDirection,
        child: lilSnack,
      );
    }

    if (onTap != null) {
      lilSnack = GestureDetector(
        onTap: onTap,
        child: lilSnack,
      );
    }

    late final Widget child;

    if (animationBuilder != null) {
      child = animationBuilder!.call(
        context,
        lilSnack,
        controller.animationController.view,
      );
    } else {
      child = _DefaultLilSnackAnimation(
        animation: controller.animationController.view,
        position: position,
        child: lilSnack,
      );
    }

    return Align(
      alignment: alignment,
      child: Padding(
        padding: externalPadding,
        child: child,
      ),
    );
  }
}
