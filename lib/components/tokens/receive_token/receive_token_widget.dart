import '/components/top_separator/top_separator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'receive_token_model.dart';
export 'receive_token_model.dart';

class ReceiveTokenWidget extends StatefulWidget {
  const ReceiveTokenWidget({Key? key}) : super(key: key);

  @override
  _ReceiveTokenWidgetState createState() => _ReceiveTokenWidgetState();
}

class _ReceiveTokenWidgetState extends State<ReceiveTokenWidget> {
  late ReceiveTokenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceiveTokenModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).backgroundcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.topSeparatorModel,
            updateCallback: () => setState(() {}),
            child: TopSeparatorWidget(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'bjys7lu3' /* Receive  */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'd5ox0e1u' /* Copy or Scan your BSC wallet a... */,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'lg2pfm1k' /* Send only binance BEP20 token ... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'RECEIVE_TOKEN_0X123GHXFFKJSDS_BTN_ON_TAP');
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'ip7tqqd4' /* 0x123ghxffkjsds */,
                      ),
                      icon: Icon(
                        Icons.content_copy_outlined,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        width: 220.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
