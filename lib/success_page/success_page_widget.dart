import 'package:another_flushbar/flushbar.dart';
import 'package:kabapay/components/CustomTimelineWidget.dart';
import 'package:kabapay/models/current_transaction_model.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';
import '../models/vault_data_model.dart';
import 'success_page_model.dart';
export 'success_page_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SuccessPageWidget extends StatefulWidget {
  const SuccessPageWidget({Key? key}) : super(key: key);

  @override
  _SuccessPageWidgetState createState() => _SuccessPageWidgetState();
}

class _SuccessPageWidgetState extends State<SuccessPageWidget> {
  late SuccessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'success_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  _onAccountNumberCopied(BuildContext context, String vaultPaymentAcountNumber) {
    // showTopSnackBar(
    //   Overlay.of(context)!,
    //   CustomSnackBar.info(
    //     message:
    //     "Veuille envoyer le montant au numéro de compte que vous venez de copier",
    //   ),
    // );
    Flushbar(
      backgroundColor: Colors.black,
      margin: EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      titleText: Text(
        FFLocalizations.of(context).getText('pay_toast_title',),
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      messageText: Text(
        vaultPaymentAcountNumber,
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      duration:  Duration(seconds: 2),
    )..show(context);
  }

  _getPayRecipientAccountNumber(CurrentTransactionModel currentTransaction, VaultDataModel? vaultData) {
    String userPaymentInstitutionName = currentTransaction.paymentInstrument?.organizationName.toLowerCase() ?? '';
    String vaultPaymentAcountNumber = vaultData?.paymentInstruments
        .firstWhere((element) => element.organizationName.toLowerCase()
        == userPaymentInstitutionName).accountNumber ?? '';
    return vaultPaymentAcountNumber;
  }

  @override
  Widget build(BuildContext context) {
    CurrentTransactionModel currentTransaction = Provider.of<CurrentTransactionModel>(context);
    VaultDataModel? vaultData = Provider.of<VaultDataModel?>(context);
    String vaultPaymentAcountNumber = '';
    if (currentTransaction.type == TransactionType.BUY) {
      vaultPaymentAcountNumber = _getPayRecipientAccountNumber(currentTransaction, vaultData);
    }
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
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
              border: Border.all(
                color: FlutterFlowTheme.of(context).backgroundcolor,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'rmg0tflb' /* Success! */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                fontSize: 32.0,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 30.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'jfgpj763' /* Your transaction was successfu... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/transaction-success.png',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        if (currentTransaction.type == TransactionType.BUY)
                          Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'x73isb0j' /* To pay, send */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '\$${currentTransaction.amountUSD} USD',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 28.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '4uxsg6tk' /* to */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SUCCESS_PAGE_PAGE_0971504436_BTN_ON_TAP');
                                  logFirebaseEvent('Button_bottom_sheet');
                                  _onAccountNumberCopied(context, vaultPaymentAcountNumber);
                                },
                                text: vaultPaymentAcountNumber,
                                icon: Icon(
                                  Icons.content_copy_outlined,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: 160.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF393939),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Text(
                                '${FFLocalizations.of(context).getText('vsl23of5')} ${currentTransaction.paymentInstrument?.accountNumber} ${currentTransaction.paymentInstrument?.organizationName} ${FFLocalizations.of(context).getText('vsl23of6')}',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('SUCCESS_PAGE_PAGE_DONE_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.goNamed(
                        'home_page',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'ba5y4wt5' /* Done */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF23A094),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
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
