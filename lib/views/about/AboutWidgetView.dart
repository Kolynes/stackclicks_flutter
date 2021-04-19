import 'package:flutter/material.dart';
import 'package:stackclicks_flutter/components/scrollable_page.dart';
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
            ScrollablePage(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Stackclicks\n\n"
                  "AdMob is one of the world’s largest CPC mobile ad networks, founded in 2006 in Mountain View, US. It offers a vast array of tools and solutions to monetize and promote apps and mobile websites. AdMob basically connects advertisers with publishers/developers via it’s mobile marketplace, enabling advertisers to create and run targeted ads and developers to generate higher profits from their advertising revenue.\n"
                  "Advertisers can utilize AdMob to promote their apps and mobile sites, via in-app advertising or cross-promoted with free house ads.\n"
                  "\n"
                  "Stackclicks is a platform that pays its members for taking a simple task daily. Not only AdMob the company is one that generate revenue from forex, advertising and marketing."
                ),
              ),
            ),
            ScrollablePage(
              child: Padding(
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
            ),
            ScrollablePage(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Terms And Conditions\n\n"
                  "Terms & Conditions for stackclicks Affiliate Marketing Income program\n\n"
                  "The Terms and Conditions (the “T&Cs”) contained herein, shall govern a Subscriber’s membership, subscription and use of stackclicks Affiliate Marketing Investment packages and/or services. The T&Cs shall apply in full force and by subscribing to any of the packages or services offered by STACKCLICKS, you expressly accept all the T&Cs contained herein in full. You must not subscribe to the services or packages of the STACKCLICKS if you have any objection or disagree with any provision of this T&Cs. \n"
                  "These T&Cs shall be read alongside STACKCLICKS Privacy Policy.\n\n"

                  "2.0    Age Restriction\n"
                  "Membership to STACKCLICKS and its services are not open to or meant to be used or/and accessed by persons under the age of 18 years. Please DO NOT subscribe to any of STACKCLICKS services or packages if you are below the above stated age. \n\n"

                  "3.0    Review and Modification of the T&Cs\n"
                  "By accepting this T&Cs as a Subscriber, you hereby acknowledge and accept that STACKCLICKSor any of its Administrators or Agents shall reserve the right to modify the T&Cs at any time without further notice to the Subscriber. Every Subscriber shall be responsible for regularly reviewing the T&Cs as the Subscriber’s continued participation in STACKCLICKS after such modification shall be deemed to be his/her acceptance of such modification. If a modification is material, STACKCLICKS may provide a 7 days’ notice prior to such material terms taking effect and this notice may be given via either STACKCLICKS WhatsApp, Telegram, Facebook, Twitter or Instagram’s platform. What constitutes a material modification shall be determined at the sole discretion of STACKCLICKS.\n\n"

                  "4.0    Terms of Participation\n"
                  "4.1    By accepting to be a Subscriber of STACKCLICKS you hereby represent that you shall provide STACKCLICKS with accurate, complete and updated registration information, including but not limited to an accurate name, bank account number and email address.\n\n"
                  "4.2    As a Subscriber, you hereby represent not to:\n"
                  "(i)    activate or use more than one Member account;\n"
                  "(ii)     select or use an Email Address of another person without the owner’s express permission;\n"
                  "(iii)     use a name subject to rights of another person without authorization from that person;\n"
                  "(iv)     use a false or misleading name, or email address to activate or use a Subscriber’s account.\n\n"

                  "4.3    By signing up for STACKCLICKS, the Subscriber is opting-in to receive other special offer via emails from STACKCLICKS. If a Subscriber does not want to receive these emails, S/he may cancel their account anytime. STACKCLICKS reserves the right to track Subscriber’s activity via  IP Address as well as individual browser activity.\n"
                  "4.4    Each Subscriber agrees not to participate in any fraudulent behavior of any kind.\n"
                  "Spamming is strictly prohibited. Any spamming done to advertise STACKCLICKS will result in immediate termination of a Subscriber’s account and a forfeiture of their earned account balance.\n\n\n"
                  "No-Refund Policy: \n"
                  "Stackclicksoffers non-tangible virtual digital services in form of coupon/registration fee and shall not issue a refund to any of its Subscribers after a purchase of any of its subscription packages has been made. Please note that by purchasing any of our STACKCLICKS subscription packages, you agree to its no refund policy.\n\n"
                  "NOTE: A subscriber who fail to perform his task will have to forfeit his payment for that day.\n"
                  "The fact that a subscriber is not paid his or her earned income within 72 hours does not mean that he will not be paid while the system keeps running. The Subscriber’s earning in such unlikely circumstance, will be restructured and carried over to the following week."
                  "If Subscriber objects to any of the provisions of this T&Cs, or any subsequent modifications to this T&Cs, or becomes dissatisfied with the Program, the Subscriber’s only recourse is to immediately discontinue participation in STACKCLICKS and properly terminate his or her membership. \n\n"
                  "EACH SUBSCRIBER EXPRESSLY AGREES THAT USE OF THE SERVICE IS AT SUBSCRIBER’S SOLE RISK. THE SERVICE IS PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS. STACKCLICKS DISCLAIMS ALL WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED BY LAW, CUSTOM OR OTHERWISE. RAMIP  MAKES NO WARRANTY REGARDING ANY SERVICES PURCHASED OR OBTAINED THROUGH THE PROGRAM OR ANY TRANSACTIONS ENTERED INTO THROUGH THE PROGRAM.  NEITHER STACKCLICKS NOR ANY OF ITS MEMBERS, SUBSIDIARIES, PUBLISHERS, SERVICE PROVIDERS, LICENSORS, OFFICERS, DIRECTORS OR EMPLOYEES SHALL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF OR RELATING TO THIS STACKCLICKS, OR RESULTING FROM THE USE OR THE INABILITY TO USE THE SERVICE OR MESSAGES RECEIVED OR TRANSACTIONS ENTERED INTO THROUGH THE STACKCLICKS OR RESULTING FROM UNAUTHORIZED ACCESS TO OR ALTERATION OF SUBSCRIBER’S TRANSMISSIONS OR DATA, INCLUDING BUT NOT LIMITED TO, DAMAGES FOR LOSS OF PROFITS OR CAPITAL, USE, DATA OR OTHER INTANGIBLE, EVEN IF SUCH PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES OR NOT."
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}