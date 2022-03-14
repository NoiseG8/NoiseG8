import 'package:fluent_ui/fluent_ui.dart';

void main() {
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
          actions: Row(children: [
            /// These actions are usually the minimize, maximize and close window
          ]),

          /// If automaticallyImplyLeading is true, a 'back button' will be added to
          /// app bar. This property can be overritten by [leading]
          automaticallyImplyLeading: false,
        ),
        pane: NavigationPane(displayMode: PaneDisplayMode.minimal, items: [
          PaneItem(icon: Icon(FluentIcons.code), title: Text("Sample Page 1")),
          PaneItem(icon: Icon(FluentIcons.design), title: Text("Sample Page 2"))
        ]),
      ));
}
