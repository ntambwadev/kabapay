import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageBalanceWidget extends StatefulWidget {
  const HomePageBalanceWidget({Key? key}) : super(key: key);

  @override
  _HomePageBalanceWidgetState createState() => _HomePageBalanceWidgetState();
}

class _HomePageBalanceWidgetState extends State<HomePageBalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'nvsz7pmg' /* Balance */,
            ),
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              '82j6thjy' /* $0 */,
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 48,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}
