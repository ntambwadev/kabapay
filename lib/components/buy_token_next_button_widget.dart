import 'package:another_flushbar/flushbar.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_token_next_button_model.dart';
export 'buy_token_next_button_model.dart';

class BuyTokenNextButtonWidget extends StatefulWidget {
  const BuyTokenNextButtonWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenNextButtonWidgetState createState() =>
      _BuyTokenNextButtonWidgetState();
}

class _BuyTokenNextButtonWidgetState extends State<BuyTokenNextButtonWidget> {
  _onNextButtonSelected(BuildContext context, CurrentTransactionModel currentTransaction) async {
    logFirebaseEvent('BUY_TOKEN_NEXT_BUTTON_NEXT_BTN_ON_TAP');
    logFirebaseEvent('Button_navigate_to');
    if (currentTransaction.amountUSD == null || currentTransaction.amountUSD == '0') {
      Flushbar(
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        title:  FFLocalizations.of(context).getText('error_title',), /* Please enter an amount */
        message:  FFLocalizations.of(context).getText('u9is7890',),
        duration:  Duration(seconds: 2),
      )..show(context);
      return;
    }
    context.pushNamed(
      'payment_methods_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  late BuyTokenNextButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyTokenNextButtonModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CurrentTransactionModel currentTransaction = Provider.of<CurrentTransactionModel>(context);
    return FFButtonWidget(
      onPressed: () async {
        _onNextButtonSelected(context, currentTransaction);
      },
      text: FFLocalizations.of(context).getText(
        '8ze2o2h0' /* Next */,
      ),
      options: FFButtonOptions(
        width: double.infinity,
        height: 50,
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
