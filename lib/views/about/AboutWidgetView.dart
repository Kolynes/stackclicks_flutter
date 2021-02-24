import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/components/widget_view_pattern/WidgetView.dart';

import 'About.dart';

class AboutWidgetView extends WidgetView<About, AboutStateController> {
  AboutWidgetView(State<About> state, {Key key}): super(state, key: key);

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "About Stackclicks",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Colors.black87
            )
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "About"),
              Tab(text: "How it works"),
              Tab(text: "Terms and Conditions")
            ],
            labelColor: Colors.black87,
            isScrollable: true,
          ),
          iconTheme: Theme.of(context).iconTheme.copyWith(
            color: Colors.black87
          ),
          backgroundColor: Colors.white,
          elevation: 0
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Stackclicks\n\n"
                "AdMob is one of the world’s largest CPC mobile ad networks, founded in 2006 in Mountain View, US. It offers a vast array of tools and solutions to monetize and promote apps and mobile websites. AdMob basically connects advertisers with publishers/developers via it’s mobile marketplace, enabling advertisers to create and run targeted ads and developers to generate higher profits from their advertising revenue.\n"
                "Advertisers can utilize AdMob to promote their apps and mobile sites, via in-app advertising or cross-promoted with free house ads.\n"
                "\n"
                "Stackclicks is a platform that pays its members for taking a simple task daily. Not only AdMob the company is one that generate revenue from forex, advertising and marketing."
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Stackclicks offers various investment to its members:\n\n"

                "SILVER: N5,000 the silver package pays you N258.33 daily for 30 days. Total= 7,750\n\n"

                "PLATINUM: N10,000 the platinum package pays you N516.66 daily for 30 days. Total= N15,500\n\n"

                "RUBY: N20,000 the ruby package pays you N1,033.33 daily for 30 days. Total=N31,000\n\n"

                "Star: N40,000 the star package pays you N2,066.66 daily for 30 days.  Total= N62,000\n\n"

                "Gold star: N80,000 Gold star package pays you N4133.33 daily for 30 days. Total = N124,000\n\n"

                "Opal: N160000 opal package pays you N8,266.66 daily for 30 days. Total= N248,000\n\n"

                "Diamond: N320,000 Diamond package pays you N16,533.33 daily for 30 days. Total =N496,000\n\n"

                "Premium: N640,000 premium package pays you N33,000.6 daily for 30 days. Total= N992,000\n\n"
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "1. PRIVACY POLICY\n\n"
                "To keep STACKCLICKS running, we use third-party advertising companies to serve ads when you visit our web site.\n"
                "These companies may use information (not including your name, address email address or telephone number) about your visits to this and other Web sites in order to provide advertisements about goods and services of interest to you. If you would like more information about this practice and to know your choices about not having this information used by these companies,\n"
                "STACKCLICKS uses a tool which collects your requests for pages and passes elements of them to search engines to assist them. We control the configuration of the tool and are responsible for any information sent to the search engines.\n\n\n"

                "2. COPYRIGHT\n\n"
                "We try not to infringe on any right-of-usage by reviewing the Terms of use/service of most of our sources and contents posted on this platform, but because Terms of use/service could change at any time and we do not guarantee to keep track of all our sources’ Terms of use/service.\n"
                "We implore any source or individual contents that feels we encroached on its copyright to give us notice of de-linking or removing contents via our contact page, we promise to remove the content from database within 48 hours of confirming the request originated from the right news source\n"
              ),
            ),
          ],
        )
      ),
    );
  }
}