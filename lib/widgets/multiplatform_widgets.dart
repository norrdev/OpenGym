import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:npng/config.dart';

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
    if (isApple) {
      return CupertinoPageScaffold(
        navigationBar: appBar as ObstructingPreferredSizeWidget?,
        child: Column(
          children: [
            Expanded(child: body),
            if (bottomNavigationBar != null) bottomNavigationBar!
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar as PreferredSizeWidget?,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      );
    }
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
    if (isApple) {
      return CupertinoTabBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
      );
    } else {
      return BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
      );
    }
  }
}

/// Page router.
PageRoute<dynamic> mpPageRoute(
    {required Widget Function(BuildContext) builder}) {
  if (isApple) {
    return CupertinoPageRoute(
      builder: builder,
    );
  } else {
    return MaterialPageRoute(
      builder: builder,
    );
  }
}

/// Cross-platform AppBar.
class MpAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final Widget? title;
  final Widget? trailing;

  @override
  final Size preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }

  const MpAppBar({
    Key? key,
    this.title,
    this.trailing,
    this.preferredSize = const Size.fromHeight(56.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isApple) {
      return CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: title,
        trailing: (trailing != null) ? trailing : const SizedBox(),
      );
    } else {
      return AppBar(
        title: title,
        actions: [
          (trailing != null) ? trailing! : const SizedBox(),
        ],
      );
    }
  }
}

/// Button.
class MpButton extends StatelessWidget {
  const MpButton({Key? key, this.label, this.onPressed}) : super(key: key);
  final String? label;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isApple) {
      return CupertinoButton.filled(
        child: Text(label!),
        onPressed: onPressed as void Function()?,
      );
    } else {
      return ElevatedButton(
        child: Text(
          label!,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: onPressed as void Function()?,
      );
    }
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
    if (isApple) {
      return CupertinoButton(
        padding: EdgeInsetsDirectional.zero,
        child: Text(label!,
            style: TextStyle(
                color: CupertinoTheme.of(context)
                    .textTheme
                    .actionTextStyle
                    .color)),
        onPressed: onPressed as void Function()?,
      );
    } else {
      return TextButton(
        child: Text(
          label!,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onPressed: onPressed as void Function()?,
      );
    }
  }
}

/// Round button with icon.
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    this.icon,
    this.fillColor,
    required this.onPressed,
  }) : super(key: key);

  final IconData? icon;
  final Function? onPressed;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed as void Function()?,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: fillColor,
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
    if (isApple) {
      return CupertinoButton(
        padding: padding,
        onPressed: onPressed as void Function()?,
        child: child ?? Text(label ?? ''),
      );
    } else {
      return TextButton(
        onPressed: onPressed as void Function()?,
        child: child ?? Text(label ?? ''),
      );
    }
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
    if (isApple) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(labelText!),
          const SizedBox(
            height: 8.0,
          ),
          CupertinoTextField(
            controller: controller,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
          ),
        ],
      );
    } else {
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
    return isApple
        ? Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(title),
              ),
              Expanded(
                flex: 1,
                child: CupertinoSwitch(
                  value: value,
                  onChanged: onChanged,
                ),
              ),
            ],
          )
        : ListTile(
            title: Text(title),
            trailing: Switch(
              value: value,
              onChanged: onChanged,
            ),
            onTap: onTap as void Function()?,
          );
  }
}

/// Validation message.
class MpValidationMessage extends StatelessWidget {
  final String message;

  const MpValidationMessage({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            message,
            textScaleFactor: 0.8,
            style: const TextStyle(color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

/// GroupSelect(Radio)
/// class NativeGroupSelect<T> from native_widgets
// class MpGroupSelect<T> extends StatelessWidget {
//   final ValueChanged<T?>? onValueChanged;
//   final Map<T, Widget> children;
//   final T groupValue;

//   MpGroupSelect({
//     Key? key,
//     this.onValueChanged,
//     required this.groupValue,
//     required this.children,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (isApple) {
//       return CupertinoSegmentedControl(
//         children: children,
//         onValueChanged: onValueChanged!,
//         groupValue: groupValue,
//       );
//     } else {
//       return Column(
//           children: children.entries
//               .map((MapEntry<T, Widget> item) => RadioListTile<T>(
//                     title: item.value,
//                     value: item.key,
//                     groupValue: groupValue,
//                     onChanged: onValueChanged,
//                   ))
//               .toList());
//     }
//   }
// }

/// Modal popup window.
Future<T?> mpModalPopup<T>({
  BuildContext? context,
  Widget? child,
}) {
  if (isApple) {
    return showCupertinoModalPopup(
      context: context!,
      builder: (BuildContext context) => child!,
    );
  } else {
    return showModalBottomSheet(
      context: context!,
      builder: (BuildContext context) => child!,
    );
  }
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
          child: RoundIconButton(
            icon: Icons.arrow_back_ios_rounded,
            fillColor: (isApple)
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
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
          child: RoundIconButton(
            icon: Icons.arrow_forward_ios_rounded,
            fillColor: (isApple)
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
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
          child: RoundIconButton(
            icon: Icons.arrow_back_ios_rounded,
            fillColor: (isApple)
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
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
          child: RoundIconButton(
            icon: Icons.arrow_forward_ios_rounded,
            fillColor: (isApple)
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
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
              RoundIconButton(
                icon: Icons.fast_rewind_rounded,
                fillColor: (isApple)
                    ? CupertinoTheme.of(context).barBackgroundColor
                    : Theme.of(context).bottomAppBarColor,
                onPressed: decreaseCallbackFast,
              ),
              const SizedBox(width: 8.0),
              RoundIconButton(
                icon: Icons.arrow_back_ios_rounded,
                fillColor: (isApple)
                    ? CupertinoTheme.of(context).barBackgroundColor
                    : Theme.of(context).bottomAppBarColor,
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
              RoundIconButton(
                icon: Icons.arrow_forward_ios_rounded,
                fillColor: (isApple)
                    ? CupertinoTheme.of(context).barBackgroundColor
                    : Theme.of(context).bottomAppBarColor,
                onPressed: increaseCallback,
              ),
              const SizedBox(width: 8.0),
              RoundIconButton(
                icon: Icons.fast_forward_rounded,
                fillColor: (isApple)
                    ? CupertinoTheme.of(context).barBackgroundColor
                    : Theme.of(context).bottomAppBarColor,
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
    return isApple
        ? CupertinoAlertDialog(
            key: key,
            title: title,
            content: content,
          )
        : AlertDialog(
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
