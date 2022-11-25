import 'package:kabapay/components/receive_token_widget.dart';

import '../components/home_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageButtonsWidget extends StatefulWidget {
  const HomePageButtonsWidget({Key? key}) : super(key: key);

  @override
  _HomePageButtonsWidgetState createState() => _HomePageButtonsWidgetState();
}

class _HomePageButtonsWidgetState extends State<HomePageButtonsWidget> {

  _onBuyButtonTap(BuildContext context) {
    logFirebaseEvent('HOME_BUY_BUTTON_Container_g4p1ceub_ON_TAP');
    logFirebaseEvent('home_buy_button_navigate_to');
    context.pushNamed(
      'tokens_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  _onSendButtonTap(BuildContext context) {
    logFirebaseEvent('HOME_SEND_BUTTON_Container_g4p1ceub_ON_TAP');
    logFirebaseEvent('home_send_button_navigate_to');
    context.pushNamed(
      'tokens_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  _onReceiveButtonTap(BuildContext context) async {
    logFirebaseEvent('HOME_RECEIVE_BUTTON_Container_g4p1ceub_ON_TAP');
    logFirebaseEvent('home_receive_button_navigate_to');
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 550,
          child: ReceiveTokenWidget(),
        ),
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).backgroundcolor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              _onBuyButtonTap(context);
            },
            child: HomeButtonWidget(titleKey: "tkmbhgt6", iconData: Icons.attach_money_outlined,),
          ),
          InkWell(
            onTap: () async {
              _onSendButtonTap(context);
            },
            child: HomeButtonWidget(titleKey: "tkmbhgt7", iconData: Icons.arrow_upward_outlined,),
          ),
          InkWell(
            onTap: () async {
              _onReceiveButtonTap(context);
            },
            child: HomeButtonWidget(titleKey: "tkmbhgt8", iconData: Icons.arrow_downward,),
          ),
        ],
      ),
    );
  }
}
