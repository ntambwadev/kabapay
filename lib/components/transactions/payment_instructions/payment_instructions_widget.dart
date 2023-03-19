import 'package:flutter/services.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/utils/snack_bar_utils.dart';

import '../../../models/BaseTransactionModel.dart';
import '../../../models/vault_data_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_instructions_model.dart';
export 'payment_instructions_model.dart';

class PaymentInstructionsWidget extends StatefulWidget {
  const PaymentInstructionsWidget({Key? key, required this.transactionModel}) : super(key: key);
  final TransactionModel transactionModel;
  @override
  _PaymentInstructionsWidgetState createState() =>
      _PaymentInstructionsWidgetState();
}

class _PaymentInstructionsWidgetState extends State<PaymentInstructionsWidget> {
  late PaymentInstructionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentInstructionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  _getPayRecipientAccountNumber(BaseTransactionModel currentTransaction, VaultDataModel? vaultData) {
    String userPaymentInstitutionName = currentTransaction.paymentInstrument?.organizationName.toLowerCase() ?? '';
    String vaultPaymentAcountNumber = vaultData?.paymentInstruments
        .firstWhere((element) => element.organizationName.toLowerCase()
        == userPaymentInstitutionName).accountNumber ?? '';
    return vaultPaymentAcountNumber;
  }

  _onCopyPayRecipientAccountNumber(BuildContext context, String payRecipientAccountNumber) async {
    await Clipboard.setData(new ClipboardData(text: payRecipientAccountNumber));
    SnackBarUtils.showCopyMessageSnackBar(
        context,
        'oq0q2q1a' /* Copied to clipboard */,
        payRecipientAccountNumber
    );
  }

  @override
  Widget build(BuildContext context) {
    VaultDataModel? vaultData = Provider.of<VaultDataModel?>(context);
    String payRecipientAccountNumber = _getPayRecipientAccountNumber(widget.transactionModel, vaultData);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Container(
        width: double.infinity,
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: ExpandableNotifier(
          initialExpanded: true,
          child: ExpandablePanel(
            header: Text(
              FFLocalizations.of(context).getText(
                'oezsg2a1' /* Payment instructions */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            collapsed: Container(),
            expanded: Container(
              // width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '1k87empz' /* To complete your transaction, ... */,
                            ),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '37hmzj2z' /* Amount to send */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${widget.transactionModel.amountUSD} USD',
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          lineHeight: 2.0,
                                        ),
                                  ),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     _onCopyAmountUSD(context, widget.transactionModel.amountUSD ?? '0');
                                  //   },
                                  //   child: Container(
                                  //     width: 55.0,
                                  //     height: 25.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context)
                                  //           .primaryBackground,
                                  //       borderRadius: BorderRadius.circular(4.0),
                                  //       shape: BoxShape.rectangle,
                                  //       border: Border.all(
                                  //         color: FlutterFlowTheme.of(context)
                                  //             .secondaryColor,
                                  //         width: 0.5,
                                  //       ),
                                  //     ),
                                  //     child: Text(
                                  //       FFLocalizations.of(context).getText(
                                  //         'qg3l5g4e' /* Copy */,
                                  //       ),
                                  //       textAlign: TextAlign.center,
                                  //       maxLines: 1,
                                  //       style: FlutterFlowTheme.of(context)
                                  //           .bodyText1
                                  //           .override(
                                  //             fontFamily: 'Poppins',
                                  //             fontSize: 12.0,
                                  //             lineHeight: 2.0,
                                  //           ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'z73au94g' /* To number */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    payRecipientAccountNumber,
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      _onCopyPayRecipientAccountNumber(
                                          context, payRecipientAccountNumber);
                                    },
                                    child: Container(
                                      width: 65.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.circular(6.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'qg3l5g4e' /* Copy */,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 2.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
            ),
          ),
        ),
      ),
    );
  }
}
