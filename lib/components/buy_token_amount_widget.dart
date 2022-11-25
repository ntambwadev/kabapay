import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyTokenAmountWidget extends StatefulWidget {
  const BuyTokenAmountWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenAmountWidgetState createState() => _BuyTokenAmountWidgetState();
}

class _BuyTokenAmountWidgetState extends State<BuyTokenAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'bvf6srr8' /* $ */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 64,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    AutoSizeText(
                      FFLocalizations.of(context).getText(
                        '9sx28qt6' /* 0 */,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 64,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ozwfhod8' /* USD */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'src5r0fb' /* =  */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '59h7pq5s' /* 0.000345 ETH */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
