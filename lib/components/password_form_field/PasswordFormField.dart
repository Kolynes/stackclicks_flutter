
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PasswordFormFieldWidgetView.dart';

class PasswordFormField extends StatefulWidget {
  
  final Key key;
  final TextEditingController controller;
  final String initialValue;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool showCursor;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder buildCounter;
  final ScrollPhysics scrollPhysics;

  final bool showToggleVisibilityIcon;

  PasswordFormField(
    {
      this.key,
      this.controller,
      this.initialValue,
      this.focusNode,
      this.decoration = const InputDecoration(),
      this.keyboardType,
      this.textCapitalization: TextCapitalization.none,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.autofocus = false,
      this.readOnly = false,
      this.toolbarOptions,
      this.showCursor,
      this.autocorrect = true,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions = true,
      this.autovalidate = false,
      this.maxLengthEnforced: true,
      this.maxLines = 1,
      this.minLines,
      this.expands = false,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled = true,
      this.cursorWidth = 2.0,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.enableInteractiveSelection: true,
      this.buildCounter,
      this.scrollPhysics,

      this.showToggleVisibilityIcon: true
    }
  );

  PasswordFormFieldStateController createState() => PasswordFormFieldStateController(showToggleVisibilityIcon: showToggleVisibilityIcon);
}

class PasswordFormFieldStateController extends State<PasswordFormField> {
  final showToggleVisibilityIcon;
  bool obscureText = true;

  PasswordFormFieldStateController({this.showToggleVisibilityIcon});

  void toggleVisibility() {
    setState(() {
      this.obscureText = !this.obscureText;
    });
  }

  Widget build(BuildContext context) => PasswordFormFieldWidgetView(this);

}