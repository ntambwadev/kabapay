import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'token_item_model.dart';
export 'token_item_model.dart';

class TokenItemWidget extends StatefulWidget {
  const TokenItemWidget({Key? key}) : super(key: key);

  @override
  _TokenItemWidgetState createState() => _TokenItemWidgetState();
}

class _TokenItemWidgetState extends State<TokenItemWidget> {
  late TokenItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TokenItemModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBtnText,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Color(0xFFB8B8B8),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 0, 12, 0),
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    '',
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'yqcnl5yr' /* Ethereum */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'o1xrnt04' /* ETH BEP20 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '9xrvaw4d' /* $ */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'zdn08gbt' /* $ 1734 */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'x6wbjhmi' /* +10.34% */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).gain,
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
