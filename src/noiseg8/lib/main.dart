import 'package:arna/arna.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:noiseg8/window/top_menu_item.dart';
import 'package:noiseg8/window/window_buttons_sized_box.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => const MainState();
}

class MainState extends StatelessWidget {
  const MainState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArnaApp(
      debugShowCheckedModeBanner: false,
      theme: ArnaThemeData(
        accentColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: FluentApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              accentColor: Colors.blue,
              brightness: Brightness.dark, // or Brightness.dark
              iconTheme: const IconThemeData(size: 24)),
          title: 'NoiseG8',
          home: NavigationView(
            appBar: NavigationAppBar(
              //title: Text('NoiseG8'),
              actions: DragToMoveArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TopMenu(),
                    Spacer(),
                    PopupButton(),
                    VolumeSlider(),
                    _WindowButtons(),
                  ],
                ),
              ),

              /// If automaticallyImplyLeading is true, a 'back button' will be added to
              /// app bar. This property can be overwritten by [leading]
              automaticallyImplyLeading: false,
            ),
            pane: NavigationPane(
                displayMode: PaneDisplayMode.minimal,
                footerItems: [
                  PaneItemSeparator(),
                  _LinkPaneItemAction(
                    icon: const Icon(FluentIcons.open_source),
                    title: const Text('Source code'),
                    link: 'https://google.com/fluent_ui',
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.settings),
                    title: const Text('Settings'),
                  ),
                ],
                items: [
                  PaneItem(
                      icon: const Icon(FluentIcons.code),
                      title: const Text("Sample Page 1")),
                  PaneItem(
                      icon: const Icon(FluentIcons.design),
                      title: const Text("Sample Page 2"))
                ]),
          )),
    );
  }
}

class PopupButton extends StatelessWidget {
  const PopupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArnaPopupMenuButton<String>(
      itemBuilder: (context) => [
        ArnaPopupMenuItem(
          child: Text(
            "First Item",
            style: ArnaTheme.of(context).textTheme.textStyle,
          ),
          value: "First Item",
        ),
        ArnaPopupMenuItem(
          child: Text(
            "Second Item",
            style: ArnaTheme.of(context).textTheme.textStyle,
          ),
          value: "Second Item",
        ),
        const ArnaPopupMenuDivider(),
        ArnaPopupMenuItem(
          child: Text(
            "Third Item",
            style: ArnaTheme.of(context).textTheme.textStyle,
          ),
          value: "Third Item",
        ),
      ],
      onSelected: (String value) => showArnaSnackbar(
        context: context,
        message: value,
      ),
    );
  }
}

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  @override
  Widget build(BuildContext context) {
    double _sliderValue = 50;
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: ArnaSlider(
          value: _sliderValue,
          min: 0,
          max: 100,
          onChanged: (double newValue) {
            setState(() => _sliderValue = newValue);
          },
        ));
  }
}

// Padding(
// padding: EdgeInsets.all(6.0),
// child: Padding(
// padding: EdgeInsets.only(left: 45.0),
// child: TopMenuItem()));

class TopMenu extends StatelessWidget {
  const TopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(6.0),
        child: Padding(
            padding: EdgeInsets.only(left: 45.0), child: TopMenuItem()));
    // IconButton(
    // icon: Icon(FluentIcons.settings, size: 20.0),
    // onPressed: null),
  }
}

class _WindowButtons extends StatelessWidget {
  const _WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FluentTheme.of(context);

    return WindowButtonsSizedBox(theme: theme);
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
