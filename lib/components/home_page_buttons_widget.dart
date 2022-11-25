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
              logFirebaseEvent('HOME_BUTTONS_Container_g4p1ceub_ON_TAP');
              logFirebaseEvent('home_button_navigate_to');

              context.pushNamed(
                'tokens_page',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
            child: HomeButtonWidget(),
          ),
          HomeButtonWidget(),
          HomeButtonWidget(),
        ],
      ),
    );
  }
}
