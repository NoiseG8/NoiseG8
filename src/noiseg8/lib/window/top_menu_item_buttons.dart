import 'package:fluent_ui/fluent_ui.dart';

class TopMenuItemButtons extends StatelessWidget {
  const TopMenuItemButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          DropDownButton(
            // leading: Icon(FluentIcons.accept),
            title: const Text('File'),
            items: [
              DropDownButtonItem(
                title: const Text('Ctrl+N'),
                leading: const Text('New Project'),
                onTap: () => debugPrint('left'),
              ),
              DropDownButtonItem(
                title: const Text('Ctrl+O'),
                leading: const Text('Open Project'),
                onTap: () => debugPrint('center'),
              ),
              DropDownButtonItem(
                title: const Text('Right'),
                leading: const Icon(FluentIcons.align_right),
                onTap: () => debugPrint('right'),
              ),
            ],
          ),
          DropDownButton(
            // leading: Icon(FluentIcons.accept),
            title: const Text('Edit'),
            items: [
              DropDownButtonItem(
                title: const Text('Ctrl+N'),
                leading: const Text('New Project'),
                onTap: () => debugPrint('left'),
              ),
              DropDownButtonItem(
                title: const Text('Ctrl+O'),
                leading: const Text('Open Project'),
                onTap: () => debugPrint('center'),
              ),
              DropDownButtonItem(
                title: const Text('Right'),
                leading: const Icon(FluentIcons.align_right),
                onTap: () => debugPrint('right'),
              ),
            ],
          ),
          DropDownButton(
            // leading: Icon(FluentIcons.accept),
            title: const Text('Preferences'),
            items: [
              DropDownButtonItem(
                title: const Text('Ctrl+N'),
                leading: const Text('New Project'),
                onTap: () => debugPrint('left'),
              ),
              DropDownButtonItem(
                title: const Text('Ctrl+O'),
                leading: const Text('Open Project'),
                onTap: () => debugPrint('center'),
              ),
              DropDownButtonItem(
                title: const Text('Right'),
                leading: const Icon(FluentIcons.align_right),
                onTap: () => debugPrint('right'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
