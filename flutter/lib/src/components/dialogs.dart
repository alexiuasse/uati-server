import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatilleat/src/components/shapes.dart';

enum DialogAction { yes, abort }
enum DialogAlert { close }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String body, {
    String leftButton = "Não",
    String rightButton = "Sim",
  }) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              TextButton(
                child: Text(leftButton),
                onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              ),
              ElevatedButton(
                child: Text(rightButton, style: const TextStyle(color: Colors.white)),
                onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              ),
            ],
          );
        });
    return (action != null) ? action : DialogAction.abort;
  }

  static Future<DialogAlert> alertDialog(
    BuildContext context,
    String? title,
    String? body,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title ?? ""),
            content: Text(body ?? ""),
            actions: <Widget>[
              TextButton(
                child: const Text("Fechar"),
                onPressed: () => Navigator.of(context).pop(DialogAlert.close),
              ),
            ],
          );
        });
    return (action != null) ? action : DialogAlert.close;
  }

  static Future<String> stringDialog(
    BuildContext context,
    String title,
    String body,
    String labelText, {
    String? initialValue,
  }) async {
    final _controller = TextEditingController();
    _controller.text = initialValue ?? "";
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(body),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controller,
                  // initialValue: initialValue,
                  minLines: 2,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: labelText,
                    fillColor: Colors.white,
                    border: outlinedBorder,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(child: const Text("Ok"), onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
    return _controller.text;
  }

  static Future<int> intDialog(
    BuildContext context,
    String title,
    String? body, {
    String? labelText,
    String? initialValue,
  }) async {
    final _controller = TextEditingController();
    _controller.text = initialValue ?? "";
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                body != null ? Text(body) : const SizedBox.shrink(),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: labelText,
                    fillColor: Colors.white,
                    border: outlinedBorder,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(child: const Text("Ok"), onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
    return int.parse(_controller.text);
  }
}
