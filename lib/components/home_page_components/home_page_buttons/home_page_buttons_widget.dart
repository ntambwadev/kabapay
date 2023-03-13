import 'package:kabapay/index.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/utils/snack_bar_utils.dart';
import 'package:provider/provider.dart';

import '../../tokens/receive_token/receive_token_widget.dart';
import '/components/home_page_components/home_button/home_button_widget.dart';
import '/../firestore/firestore_service.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/../models/user_model.dart';
import 'home_page_buttons_model.dart';
export 'home_page_buttons_model.dart';
import '/flutter_flow/flutter_flow_model.dart';

class HomePageButtonsWidget extends StatefulWidget {
  const HomePageButtonsWidget({Key? key}) : super(key: key);

  @override
  _HomePageButtonsWidgetState createState() => _HomePageButtonsWidgetState();
}

class _HomePageButtonsWidgetState extends State<HomePageButtonsWidget> {
  _onBuyButtonTap(BuildContext context, UserModel? userModel) async {
    logFirebaseEvent('HOME_BUY_BUTTON_Container_g4p1ceub_ON_TAP');
    logFirebaseEvent('home_buy_button_navigate_to');
    if(!_validatePendingTransactions(context)) {
      SnackBarUtils.showWarningSnackBar(context, 'pending_tx_warning');
      return;
    }
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .selectTxType(TransactionType.BUY);
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .addRecipientAddress(userModel?.address);
    context.pushNamed(
      'tokens_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  _onSendButtonTap(BuildContext context) {
    logFirebaseEvent('HOME_SEND_BUTTON_Container_g4p1ceub_ON_TAP');
    logFirebaseEvent('home_send_button_navigate_to');
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .selectTxType(TransactionType.SEND);
    context.pushNamed(
      'select_recipient_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  _onReceiveButtonTap(BuildContext context) async {
    logFirebaseEvent('HOME_RECEIVE_BUTTON_Container_g4p1ceub_ON_TAP');
    logFirebaseEvent('home_receive_button_navigate_to');
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 550,
          child: ReceiveTokenWidget(),
        ),
      );
    },
    );
  }

  bool _validatePendingTransactions(BuildContext context) {
    List<TransactionModel> transactions = Provider.of<List<TransactionModel>>(context, listen: false);
    return transactions.where((tx) => tx.status == TransactionStatus.PAYIN_WAITING_FOR_USER_PAYMENT || tx.status == TransactionStatus.PAYIN_TRANSACTION_CREATED).isEmpty;
  }

  late HomePageButtonsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageButtonsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<UserModel?>(context);
    return Container(
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).backgroundcolor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              _onBuyButtonTap(context, userModel);
            },
            child: wrapWithModel(
              model: _model.homeButtonModel1,
              updateCallback: () => setState(() {}),
              child: HomeButtonWidget(titleKey: "tkmbhgt6", iconData: Icons.attach_money_outlined,),
            ),
          ),
          InkWell(
            onTap: () async {
              _onSendButtonTap(context);
            },
            child: wrapWithModel(
              model: _model.homeButtonModel2,
              updateCallback: () => setState(() {}),
              child: HomeButtonWidget(titleKey: "tkmbhgt7", iconData: Icons.arrow_upward_outlined,),
            ),
          ),
          InkWell(
            onTap: () async {
              _onReceiveButtonTap(context);
            },
            child: wrapWithModel(
              model: _model.homeButtonModel3,
              updateCallback: () => setState(() {}),
              child: HomeButtonWidget(titleKey: "tkmbhgt8", iconData: Icons.arrow_downward,),
            ),
          ),
        ],
      ),
    );
  }
}
