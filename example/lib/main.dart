import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lil_snack/lil_snack.dart';

final _lilSnackTheme = LilSnackTheme(
  successIconColor: Colors.white,
  warningIconColor: Colors.white,
  errorIconColor: Colors.white,
  notificationIconColor: Colors.black,
  successBackgroundColor: Colors.green,
  warningBackgroundColor: Colors.deepOrange.shade300,
  errorBackgroundColor: Colors.red,
  notificationBackgroundColor: Colors.grey.shade300,
  borderRadius: BorderRadius.circular(16),
  boxShadow: null,
  iconSize: 24,
  successTextStyle: const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  warningTextStyle: const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  errorTextStyle: const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  notificationTextStyle: const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  ),
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Lil Snack Example',
        theme: ThemeData.light().copyWith(
          extensions: [_lilSnackTheme],
        ),
        home: const LilSnackMessenger(
          child: _Root(),
        ),
      );
}

@immutable
class _Root extends StatefulWidget {
  const _Root();

  @override
  State<_Root> createState() => _RootState();
}

class _RootState extends State<_Root> {
  int page = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: page,
          children: const [
            _TypedMessagesPage(),
            _CustomMessagesPage(),
            _CustomChildMessagesPage(),
          ],
        ),
        persistentFooterAlignment: AlignmentDirectional.bottomCenter,
        persistentFooterButtons: [
          CupertinoButton(
            onPressed: _hide,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minSize: 20,
            child: const Text('Hide'),
          ),
          CupertinoButton(
            onPressed: _removeAll,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minSize: 20,
            child: const Text('Remove all'),
          ),
        ],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (v) => setState(() => page = v),
          currentIndex: page,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Text(
                '1',
                style: TextStyle(fontSize: 20),
              ),
              label: 'Typed messages',
            ),
            BottomNavigationBarItem(
              icon: Text(
                '2',
                style: TextStyle(fontSize: 20),
              ),
              label: 'Custom messages',
            ),
            BottomNavigationBarItem(
              icon: Text(
                '3',
                style: TextStyle(fontSize: 20),
              ),
              label: 'Custom child messages',
            ),
          ],
        ),
      );

  /// Hides current message.
  void _hide() => LilSnackMessenger.of(context).hide();

  /// Removes all messages.
  void _removeAll() => LilSnackMessenger.of(context).removeAll();
}

@immutable
class _TypedMessagesPage extends StatelessWidget {
  const _TypedMessagesPage();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showSuccess(context),
                  child: const Text('Show "Success"'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showBottomSuccess(context),
                    child: const Text('Show bottom "Success"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showNonUniqueSuccess(context),
                    child: const Text('Show non unique "Success"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showWarning(context),
                    child: const Text('Show "Warning"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showWarningWithAction(context),
                    child: const Text('Show "Warning" with action'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showError(context),
                    child: const Text('Show "Error"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showNonDismissibleError(context),
                    child: const Text('Show non dismissible "Error"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showNotification(context),
                    child: const Text('Show "Notification"'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showNotificationWithoutIcon(context),
                    child: const Text('Show "Notification" without icon'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () =>
                        _showNotificationWithPressingHandler(context),
                    child:
                        const Text('Show "Notification" with pressing handler'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  /// Adds a success message to the queue.
  void _showSuccess(BuildContext context) => LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.success,
          text: 'Success message.',
        ),
      );

  /// Adds a non unique success message to the queue.
  void _showNonUniqueSuccess(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.success,
          text: 'Non unique success message.',
          unique: false,
        ),
      );

  /// Adds a bottom success message to the queue.
  void _showBottomSuccess(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.success,
          text: 'Bottom Success message.',
          position: LilSnackPosition.bottom,
        ),
      );

  /// Adds a warning message to the queue.
  void _showWarning(BuildContext context) => LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.warning,
          text: 'Warning message.',
        ),
      );

  /// Adds a warning message with action to the queue.
  void _showWarningWithAction(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        LilSnack(
          type: LilSnackType.warning,
          text: 'Warning message with action.',
          trailing: CupertinoButton(
            // To keep your message unique, add a key to the passed widgets,
            // such as an action, content, or icon. Otherwise, the message
            // uniqueness check will not work correctly.
            key: const Key('warning-message-action'),
            onPressed: () => debugPrint('Action!'),
            minSize: 20,
            padding: EdgeInsets.zero,
            child: const Text('Action'),
          ),
        ),
      );

  /// Adds an error message to the queue.
  void _showError(BuildContext context) => LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.error,
          text: 'Error message.',
        ),
      );

  /// Adds a non-dismissible error message to the queue.
  void _showNonDismissibleError(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.error,
          text: 'Non dismissible error message.',
          dismissible: false,
        ),
      );

  /// Adds a notification message to the queue.
  void _showNotification(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.notification,
          text: 'Notification message.',
        ),
      );

  /// Adds a notification message without icon to the queue.
  void _showNotificationWithoutIcon(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        const LilSnack(
          type: LilSnackType.notification,
          text: 'Notification message without icon.',
          showIcon: false,
        ),
      );

  /// Adds a notification message with pressing handler to the queue.
  void _showNotificationWithPressingHandler(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        LilSnack(
          type: LilSnackType.notification,
          text: 'Notification message with pressing handler.',
          onTap: () => debugPrint('Notification!'),
        ),
      );
}

@immutable
class _CustomMessagesPage extends StatelessWidget {
  const _CustomMessagesPage();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showWelcome(context),
                  child: const Text('Show "Welcome"'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    onPressed: () => _showGoodbye(context),
                    child: const Text('Show "Goodbye"'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // These two messages will be considered the same if you remove the keys
  // from the widgets being passed.
  //
  // Therefore, set the keys for the passed widgets.

  /// Adds a welcome message to the queue.
  void _showWelcome(BuildContext context) => LilSnackMessenger.of(context).show(
        CustomLilSnack(
          leading: CupertinoButton(
            key: const Key('welcome-button'),
            onPressed: () => debugPrint("Welcome!"),
            minSize: 20,
            padding: EdgeInsets.zero,
            child: const Text('Say "Welcome!"'),
          ),
          content: const Text(
            key: Key('welcome-text'),
            'Welcome!',
            maxLines: 1,
            textAlign: TextAlign.right,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.4,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          dismissDirection: DismissDirection.startToEnd,
          // Custom animation.
          animationBuilder: (context, lilSnack, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: lilSnack,
          ),
        ),
      );

  /// Adds a goodbye message to the queue.
  void _showGoodbye(BuildContext context) => LilSnackMessenger.of(context).show(
        CustomLilSnack(
          leading: CupertinoButton(
            key: const Key('goodbye-button'),
            onPressed: () => debugPrint("Goodbye!"),
            minSize: 20,
            padding: EdgeInsets.zero,
            child: const Text('Say "Goodbye!"'),
          ),
          content: const Text(
            key: Key('goodbye-text'),
            'Goodbye!',
            maxLines: 1,
            textAlign: TextAlign.right,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.4,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          dismissDirection: DismissDirection.endToStart,
          // Custom animation.
          animationBuilder: (context, lilSnack, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: lilSnack,
          ),
        ),
      );
}

@immutable
class _CustomChildMessagesPage extends StatelessWidget {
  const _CustomChildMessagesPage();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => _showCustomChild(context),
            child: const Text('Show message with custom child'),
          ),
        ),
      );

  /// Adds a custom child message to the queue.
  void _showCustomChild(BuildContext context) =>
      LilSnackMessenger.of(context).show(
        CustomChildLilSnack(
          child: DecoratedBox(
            key: const Key('red-box'),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: SizedBox.fromSize(
              size: const Size.fromHeight(150),
            ),
          ),
          // Custom animation.
          animationBuilder: (context, lilSnack, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: lilSnack,
          ),
        ),
      );
}
