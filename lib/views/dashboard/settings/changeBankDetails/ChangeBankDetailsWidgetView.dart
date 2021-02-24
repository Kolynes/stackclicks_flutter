import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/utils/validators.dart';

import 'ChangeBankDetails.dart';

class ChangeBankDetailsWidgetView extends WidgetView<ChangeBankDetails, ChangeBankDetailsStateController> {
  ChangeBankDetailsWidgetView(State<ChangeBankDetails> state, {Key key}): super(state, key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Bank Details"),
        elevation: 0,
      ),
      body: ScrollablePage(
        padding: EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
        child: Form(
          key: state.changeBankDetailsFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Account Number",
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      MdiIcons.numeric
                    )
                  ),
                  focusNode: state.accountNumberFocusNode,
                  validator: requiredLengthValidator(min: 10, max: 10),
                  onChanged: (value) => state.accountNumber = value,
                  initialValue: state.accountNumber,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) => state.accountNameFocusNode.requestFocus(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Account Name",
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      MdiIcons.accountOutline
                    )
                  ),
                  focusNode: state.accountNameFocusNode,
                  validator: requiredValidator,
                  onChanged: (value) => state.accountName = value,
                  initialValue: state.accountName,
                  onFieldSubmitted: (value) => state.bankNameFocusNode.requestFocus(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Bank Name",
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      MdiIcons.bankOutline
                    )
                  ),
                  focusNode: state.bankNameFocusNode,
                  validator: requiredValidator,
                  initialValue: state.bankName,
                  onChanged: (value) => state.bankName = value,
                  onFieldSubmitted: (value) => state.changeBankDetails()
                ),
              ),
              state.error != ""
                ?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.error,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.red
                    )
                  )
                )
                :SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: state.changingBankDetails
                    ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                    :Icon(MdiIcons.arrowRight),
                  onPressed: state.changeBankDetails
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}