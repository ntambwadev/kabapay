import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeButtonWidget extends StatefulWidget {
  const HomeButtonWidget({Key? key, required this.titleKey, required this.iconData}) : super(key: key);
  final String titleKey;
  final IconData iconData;

  @override
  _HomeButtonWidgetState createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 50,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconData,
            color: Colors.black,
            size: 24,
          ),
          Text(
            FFLocalizations.of(context).getText(
              widget.titleKey /* Buy, Send, Receive */,
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context)
                .subtitle1
                .override(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
