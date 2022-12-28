import '../components/nav_back_button_widget.dart';
import '../components/buy_token_amount_widget.dart';
import '../components/buy_token_next_button_widget.dart';
import '../components/number_keyboard_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyTokenPageWidget extends StatefulWidget {
  const BuyTokenPageWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenPageWidgetState createState() => _BuyTokenPageWidgetState();
}

class _BuyTokenPageWidgetState extends State<BuyTokenPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<BuyTokenAmountWidgetState> _tokenAmountWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'buy_token_page'});
  }

  _onKeyboardTap(String value) {
    _tokenAmountWidgetKey.currentState?.onKeyboardTap(value);
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
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
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                  BuyTokenAmountWidget(key: _tokenAmountWidgetKey,),
                  NumberKeyboardWidget(callback: _onKeyboardTap),
                  BuyTokenNextButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
