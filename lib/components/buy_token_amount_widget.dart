import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_token_amount_model.dart';
export 'buy_token_amount_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class BuyTokenAmountWidget extends StatefulWidget {
  const BuyTokenAmountWidget({Key? key}) : super(key: key);

  @override
  BuyTokenAmountWidgetState createState() => BuyTokenAmountWidgetState();
}

class BuyTokenAmountWidgetState extends State<BuyTokenAmountWidget> {
  late BuyTokenAmountModel _model;
  var amount = '0';
  var tokenAmount = '';
  double tokenPrice = 0.0;
  var tokenSymbol = '';
  var decimalNumber = 7;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    TokenModel? tokenModel =
        Provider.of<CurrentTransactionModel>(context, listen: false).token;
    tokenSymbol = tokenModel?.symbol.toUpperCase() ?? "";
    tokenPrice = tokenModel?.tokenMetadata.currentPrice ?? 0.0;
    if (tokenSymbol == "BUSD" || tokenSymbol == "USDT") {
      decimalNumber = 2;
    }
    _model = createModel(context, () => BuyTokenAmountModel());
  }

  onKeyboardTap(String value) {
    setState(() {
      if (value == '.') {
        return;
        // Note: We don't support decimal values for now because of ussd limitations
        // if ((amount.length == 0 && amount == "0") || amount.contains(".")) {
        //   return;
        // }
        // amount = amount + value;
      } else if (value == '<') {
        if (amount.length == 1) {
          amount = '0';
          tokenAmount = '0';
          return;
        }
        amount = removeLast(amount);
      } else if (amount == '0') {
        amount = value;
        tokenAmount = '0';
      } else if (amount.length  > 3) {
        return;
      } else {
        amount = amount + value;
      }
      tokenAmount = (double.parse(amount) / tokenPrice).toStringAsFixed(decimalNumber);
    });
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .addAmount(amount, tokenAmount);
    print(value);
  }

  String removeLast(String word) {
    List<String> c = word.split("");
    c.removeLast();
    return c.join();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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
                      '\$',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 64,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    AutoSizeText(
                    '$amount',
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
                      '$tokenAmount $tokenSymbol',
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
