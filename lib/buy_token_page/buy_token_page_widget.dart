import '../components/nav_back_button_widget.dart';
import '../components/buy_token_amount_widget.dart';
import '../components/buy_token_next_button_widget.dart';
import '../components/number_keyboard_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_token_page_model.dart';
export 'buy_token_page_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class BuyTokenPageWidget extends StatefulWidget {
  const BuyTokenPageWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenPageWidgetState createState() => _BuyTokenPageWidgetState();
}

class _BuyTokenPageWidgetState extends State<BuyTokenPageWidget> {
  late BuyTokenPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<BuyTokenAmountWidgetState> _tokenAmountWidgetKey = GlobalKey();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyTokenPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'buy_token_page'});
  }

  _onKeyboardTap(String value) {
    _tokenAmountWidgetKey.currentState?.onKeyboardTap(value);
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
            title: NavBackButtonWidget(
              titleKey: 'np0tkmuy' /* Buy Token */,
              firebaseEvent: 'BUY_TOKEN_chevron_left_ICN_ON_TAP',
              firebaseEvent2: 'IconButton_navigate_back',
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
                    child: BuyTokenAmountWidget(key: _tokenAmountWidgetKey,),
                  ),
                  wrapWithModel(
                    model: _model.numberKeyboardModel,
                    updateCallback: () => setState(() {}),
                    child: NumberKeyboardWidget(callback: _onKeyboardTap),
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
