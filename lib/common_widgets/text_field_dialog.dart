import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldDialog extends HookWidget {
  const TextFieldDialog({
    Key? key,
    this.initial,
    this.validator,
    this.title,
  }) : super(key: key);

  final String? initial;
  final String? Function(String?)? validator;
  final Widget? title;

  void _return(BuildContext context, String name) {
    Navigator.of(context).pop(name);
  }

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initial);
    final theme = Theme.of(context);
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) title!,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                autofocus: true,
                controller: controller,
                onFieldSubmitted: (name) => _return(context, name),
                autovalidateMode: AutovalidateMode.always,
                validator: validator,
              ),
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () => _return(context, controller.text),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
