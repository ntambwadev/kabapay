import 'package:another_flushbar/flushbar.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/snack_bar_utils.dart';
import '/flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/models/transaction_model.dart';
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
      SnackBarUtils.showErrorSnackBar(context, 'u9is7890');
      return;
    }

    switch (currentTransaction.type) {
      case TransactionType.BUY:
        context.pushNamed(
          'payment_methods_page',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.rightToLeft,
            ),
          },
        );
        break;
      case TransactionType.SEND:
        context.pushNamed(
          'confirmation_page',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.rightToLeft,
            ),
          },
        );
        break;
      default:
        break;
    }
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
    _model.maybeDispose();

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
        height: 50.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
