import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBackButtonWidget extends StatefulWidget {
  const NavBackButtonWidget({Key? key}) : super(key: key);

  @override
  _NavBackButtonWidgetState createState() => _NavBackButtonWidgetState();
}

class _NavBackButtonWidgetState extends State<NavBackButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 50,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'NAV_BACK_BUTTON_arrow_back_rounded_ICN_O');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
          child: Text(
            FFLocalizations.of(context).getText(
              'dqz8qdg4' /* Confirm your code */,
            ),
            style: FlutterFlowTheme.of(context).title1,
          ),
        ),
      ],
    );
  }
}
