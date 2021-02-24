import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/utils/validators.dart';

import 'SetBankDetails.dart';

class SetBankDetailsWidgetView extends WidgetView<SetBankDetails, SetBankDetailsStateController> {
  SetBankDetailsWidgetView(State<SetBankDetails> state, {Key key}): super(state, key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Bank Details"),
        elevation: 0,
      ),
      body: ScrollablePage(
        padding: null,
        safeArea: false,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 250,
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                    "lib/assets/images/logo.png",
                    width: 100,
                  ),
                  backgroundColor: Colors.white,
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: state.setBankDetailsFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        onChanged: (value) => state.bankName = value,
                        onFieldSubmitted: (value) => state.setBankDetails()
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.error,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.red
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * .7,
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20)
                          )
                        ),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          child: state.settingBankDetails
                            ?Transform.scale(scale: .7, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)))
                            :Text("Save", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                          onPressed: state.setBankDetails
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        )
      )
    );
  }
}