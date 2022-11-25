import '../components/nav_back_button_widget.dart';
import '../components/number_keyboard_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyTokenPageWidget extends StatefulWidget {
  const BuyTokenPageWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenPageWidgetState createState() => _BuyTokenPageWidgetState();
}

class _BuyTokenPageWidgetState extends State<BuyTokenPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'buy_token_page'});
  }

  _onKeyboardTap(String value) {
    _priceWidgetKey.currentState?.onKeyboardTap(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: NavBackButtonWidget(
              titleKey: 'np0tkmuy' /* Buy Token */,
              firebaseEvent: 'BUY_TOKEN_chevron_left_ICN_ON_TAP',
              firebaseEvent2: 'IconButton_navigate_back',
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).backgroundcolor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
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
                                      'e3jcp2my' /* $ */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 64,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'zf6yii2x' /* 0 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 64,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gi7eetc3' /* USD */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
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
                                      'ue9pzn39' /* =  */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'w851v3so' /* 0.000345 ETH */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  NumberKeyboardWidget(callback: _onKeyboardTap),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('BUY_TOKEN_PAGE_PAGE_NEXT_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        'payment_methods_page',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '3do0c6iw' /* Next */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
