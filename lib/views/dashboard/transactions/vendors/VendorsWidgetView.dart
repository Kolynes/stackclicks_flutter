import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/store/Store.dart';
import 'Vendors.dart';

class VendorsWidgetView extends WidgetView<Vendors, VendorsStateController> {
  VendorsWidgetView(VendorsStateController state, {Key key}): super(state, key: key);

  @override 
  Widget build(BuildContext context) { 
    return PropertyChangeConsumer<Store>(
      properties: [ModuleProperties.vendors],
      builder: (context, store, properties) {
        return Container(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: state.refreshController,
            onRefresh: state.onRefresh,
            onLoading: state.onLoading,
            child: (store.vendors ?? []).length == 0
              ?Center(
                child: state.gettingVendors
                  ?Transform.scale(scale: 1, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)))
                  :Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.accountSupervisorOutline,
                        size: 200,
                        color: Colors.black38
                      ),
                      Text(
                        "No Vendors available currently"
                      )
                    ],
                  )
              )
              :ListView.builder(
                itemCount: store.vendors.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          store.vendors[index].name[0].toUpperCase(),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        store.vendors[index].name,
                        style: Theme.of(context).textTheme.headline6
                      ),
                      subtitle: Text(
                        store.vendors[index].whatsappLink,
                        style: Theme.of(context).textTheme.caption
                      ),
                      onTap: () => state.goToVendor(store.vendors[index]),
                    ),
                    Divider(
                      indent: 70,
                    )
                  ],
                )
              )
          )
        );
      }
    );
  }
}