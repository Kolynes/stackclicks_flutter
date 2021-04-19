
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widget_view_pattern/WidgetView.dart';

import 'PasswordFormField.dart';

class PasswordFormFieldWidgetView extends WidgetView<PasswordFormField, PasswordFormFieldStateController> {
  PasswordFormFieldWidgetView(PasswordFormFieldStateController state) : super(state);


  @override
  Widget build(BuildContext context) {
    
    var eyeOutlineButton = IconButton(
      icon: Icon(MdiIcons.eyeOutline),
      onPressed: state.toggleVisibility,
    );
    
    var eyeOffOutlineButton = IconButton(
      icon: Icon(MdiIcons.eyeOffOutline),
      onPressed: state.toggleVisibility,
    );

    return TextFormField(
      key: state.widget.key,
      controller: state.widget.controller, 
      initialValue: state.widget.initialValue,
      focusNode: state.widget.focusNode,
      decoration: state.widget.showToggleVisibilityIcon? state.widget.decoration.copyWith(suffixIcon: state.obscureText? eyeOutlineButton : eyeOffOutlineButton) : state.widget.decoration,
      keyboardType: state.widget.keyboardType,
      textCapitalization: state.widget.textCapitalization, 
      textInputAction: state.widget.textInputAction,
      style: state.widget.style,
      strutStyle: state.widget.strutStyle,
      textDirection: state.widget.textDirection,
      textAlign: state.widget.textAlign, 
      textAlignVertical: state.widget.textAlignVertical,
      autofocus: state.widget.autofocus, 
      readOnly: state.widget.readOnly, 
      toolbarOptions: state.widget.toolbarOptions,
      showCursor: state.widget.showCursor,
      obscureText: state.obscureText, 
      autocorrect: state.widget.autocorrect,
      smartDashesType: state.widget.smartDashesType,
      smartQuotesType: state.widget.smartQuotesType,
      enableSuggestions: state.widget.enableSuggestions,
      autovalidateMode: state.widget.autovalidateMode, 
      maxLengthEnforced: state.widget.maxLengthEnforced,
      maxLines: state.widget.maxLines, 
      minLines: state.widget.minLines,
      expands: state.widget.expands, 
      maxLength: state.widget.maxLength,
      onChanged: state.widget.onChanged,
      onTap: state.widget.onTap,
      onEditingComplete: state.widget.onEditingComplete,
      onFieldSubmitted: state.widget.onFieldSubmitted,
      onSaved: state.widget.onSaved,
      validator: state.widget.validator,
      inputFormatters: state.widget.inputFormatters,
      enabled: state.widget.enabled,
      cursorWidth: state.widget.cursorWidth,
      cursorRadius: state.widget.cursorRadius,
      cursorColor: state.widget.cursorColor,
      keyboardAppearance: state.widget.keyboardAppearance,
      scrollPadding: state.widget.scrollPadding,
      enableInteractiveSelection: state.widget.enableInteractiveSelection,
      buildCounter: state.widget.buildCounter,
      scrollPhysics: state.widget.scrollPhysics,
    );
  }
  
}