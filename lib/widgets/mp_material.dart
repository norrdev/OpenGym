import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Scaffold.
class MpScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  const MpScaffold(
      {Key? key, this.appBar, required this.body, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar as PreferredSizeWidget?,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

/// Bottom navigation bar.
class MpBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final void Function(int)? onTap;
  const MpBottomNavigationBar(
      {Key? key, required this.items, required this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

/// Page router.
PageRoute<dynamic> mpPageRoute(
    {required Widget Function(BuildContext) builder}) {
  return MaterialPageRoute(
    builder: builder,
  );
}

/// Cross-platform AppBar.
class MpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? trailing;

  @override
  final Size preferredSize;

  const MpAppBar({
    Key? key,
    this.title,
    this.trailing,
    this.preferredSize = const Size.fromHeight(56.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: [
        (trailing != null) ? trailing! : const SizedBox(),
      ],
    );
  }
}

/// Button.
class MpButton extends StatelessWidget {
  const MpButton({Key? key, this.label, this.onPressed}) : super(key: key);
  final String? label;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label!,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}

/// Link button.
class MpLinkButton extends StatelessWidget {
  const MpLinkButton({Key? key, this.label, this.onPressed, this.context})
      : super(key: key);
  final String? label;
  final Function? onPressed;
  final BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        label!,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}

/// FlatButton.
class MpFlatButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const MpFlatButton({
    Key? key,
    this.label,
    this.onPressed,
    this.padding,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed as void Function()?,
      child: child ?? Text(label ?? ''),
    );
  }
}

/// Text field.
class MpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  const MpTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.inputFormatters,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      inputFormatters: inputFormatters,
      readOnly: readOnly,
    );
  }
}

/// Switch.
class MpSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Function? onTap;

  const MpSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      onTap: onTap as void Function()?,
    );
  }
}

/// Modal popup window.
Future<T?> mpModalPopup<T>({
  BuildContext? context,
  Widget? child,
}) {
  return showModalBottomSheet(
    context: context!,
    builder: (BuildContext context) => child!,
  );
}

class MpChangeIntField extends StatelessWidget {
  final int? value;
  final Function? increaseCallback;
  final Function? decreaseCallback;

  const MpChangeIntField({
    Key? key,
    @required this.value,
    this.decreaseCallback,
    this.increaseCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MpFlatButton(
            child: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: decreaseCallback,
          ),
        ),
        SizedBox(
          width: 70.0,
          child: Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: MpFlatButton(
            child: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: increaseCallback,
          ),
        ),
      ],
    );
  }
}

class MpChangeDoubleField extends StatelessWidget {
  final double? value;
  final Function? increaseCallback;
  final Function? decreaseCallback;

  const MpChangeDoubleField({
    Key? key,
    @required this.value,
    this.decreaseCallback,
    this.increaseCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MpFlatButton(
            child: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: decreaseCallback,
          ),
        ),
        SizedBox(
          width: 70.0,
          child: Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: MpFlatButton(
            child: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: increaseCallback,
          ),
        ),
      ],
    );
  }
}

class MpChangeDoubleFieldExtended extends StatelessWidget {
  final double? value;
  final Function? increaseCallback;
  final Function? decreaseCallback;
  final Function? increaseCallbackFast;
  final Function? decreaseCallbackFast;

  const MpChangeDoubleFieldExtended({
    Key? key,
    @required this.value,
    this.decreaseCallback,
    this.increaseCallback,
    this.decreaseCallbackFast,
    this.increaseCallbackFast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MpFlatButton(
                child: const Icon(Icons.fast_rewind_rounded),
                onPressed: decreaseCallbackFast,
              ),
              MpFlatButton(
                child: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: decreaseCallback,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 70.0,
          child: Text(
            value.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MpFlatButton(
                child: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: increaseCallback,
              ),
              MpFlatButton(
                child: const Icon(Icons.fast_forward_rounded),
                onPressed: increaseCallbackFast,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Alert dialog.
class MpAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  const MpAlertDialog({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      title: title,
      content: content,
    );
  }
}

void mpShowToast(String message,
    {required BuildContext context,
    Color backgroundColor = Colors.blueAccent}) {
  //if (!mounted) return;
  showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Flash(
          backgroundColor: backgroundColor,
          controller: controller,
          position: FlashPosition.bottom,
          behavior: FlashBehavior.fixed,
          child: FlashBar(
            content: Text(message),
          ),
        );
      });
}

/// List tile.
class MpListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const MpListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
