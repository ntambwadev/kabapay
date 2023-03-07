import '/components/buy_token_amount_widget.dart';
import '/components/buy_token_next_button_widget.dart';
import '/components/number_keyboard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_token_page_model.dart';
export 'buy_token_page_model.dart';

class BuyTokenPageWidget extends StatefulWidget {
  const BuyTokenPageWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenPageWidgetState createState() => _BuyTokenPageWidgetState();
}

class _BuyTokenPageWidgetState extends State<BuyTokenPageWidget> {
  late BuyTokenPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyTokenPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'buy_token_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 28.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'BUY_TOKEN_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'np0tkmuy' /* Buy Token */,
                    ),
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
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
                  wrapWithModel(
                    model: _model.buyTokenAmountModel,
                    updateCallback: () => setState(() {}),
                    child: BuyTokenAmountWidget(),
                  ),
                  wrapWithModel(
                    model: _model.numberKeyboardModel,
                    updateCallback: () => setState(() {}),
                    child: NumberKeyboardWidget(),
                  ),
                  wrapWithModel(
                    model: _model.buyTokenNextButtonModel,
                    updateCallback: () => setState(() {}),
                    child: BuyTokenNextButtonWidget(),
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
