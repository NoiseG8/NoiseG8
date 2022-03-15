import 'package:fluent_ui/fluent_ui.dart';
import 'package:url_launcher/link.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  // Use it only after calling `hiddenWindowAtLaunch`
  windowManager.waitUntilReadyToShow().then((_) async {
    // Hide window title bar
    await windowManager.setMinimumSize(const Size(600, 400));
    await windowManager.setTitleBarStyle('hidden');
    // await windowManager.setSize(const Size(800, 600));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => FluentApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.blue,
          brightness: Brightness.dark, // or Brightness.dark
          iconTheme: const IconThemeData(size: 24)),
      title: 'NoiseG8',
      home: NavigationView(
        appBar: NavigationAppBar(
          title: Text('NoiseG8'),
          actions: DragToMoveArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Spacer(), WindowButtons()],
            ),
          ),

          /// If automaticallyImplyLeading is true, a 'back button' will be added to
          /// app bar. This property can be overritten by [leading]
          automaticallyImplyLeading: false,
        ),
        pane:
            NavigationPane(displayMode: PaneDisplayMode.minimal, footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
          ),
          _LinkPaneItemAction(
            icon: const Icon(FluentIcons.open_source),
            title: const Text('Source code'),
            link: 'https://google.com/fluent_ui',
          ),
        ], items: [
          PaneItem(icon: Icon(FluentIcons.code), title: Text("Sample Page 1")),
          PaneItem(icon: Icon(FluentIcons.design), title: Text("Sample Page 2"))
        ]),
      ));
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _LinkPaneItemAction extends PaneItem {
  _LinkPaneItemAction({
    required Widget icon,
    required this.link,
    title,
    infoBadge,
    focusNode,
    autofocus = false,
  }) : super(
          icon: icon,
          title: title,
          infoBadge: infoBadge,
          focusNode: focusNode,
          autofocus: autofocus,
        );

  final String link;

  @override
  Widget build(
    BuildContext context,
    bool selected,
    VoidCallback? onPressed, {
    PaneDisplayMode? displayMode,
    bool showTextOnTop = true,
    bool? autofocus,
  }) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, followLink) => super.build(
        context,
        selected,
        followLink,
        displayMode: displayMode,
        showTextOnTop: showTextOnTop,
        autofocus: autofocus,
      ),
    );
  }
}
