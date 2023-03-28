import 'package:chewie/src/models/option_item.dart';
import 'package:flutter/material.dart';

class OptionsDialog extends StatelessWidget {
  const OptionsDialog({
    Key? key,
    required this.options,
    this.cancelButtonText,
  }) : super(key: key);

  final List<OptionItem> options;
  final String? cancelButtonText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () => Navigator.of(context).pop(options[i]),
                leading: Icon(options[i].iconData),
                title: Text(options[i].title),
                subtitle: options[i].subtitle != null ? Text(options[i].subtitle!) : null,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              thickness: 1.0,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            leading: const Icon(Icons.close),
            title: Text(
              cancelButtonText ?? 'Cancel',
            ),
          ),
        ],
      ),
    );
  }
}
