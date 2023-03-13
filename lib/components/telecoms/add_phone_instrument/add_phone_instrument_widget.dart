import 'package:another_flushbar/flushbar.dart';
import 'package:kabapay/firestore/firestore_service.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import 'package:kabapay/models/vault_data_model.dart';
import 'package:kabapay/utils/snack_bar_utils.dart';

import '/components/telecoms/telecom_selector/telecom_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/models/current_transaction_model.dart';
import 'add_phone_instrument_model.dart';

class AddPhoneInstrumentWidget extends StatefulWidget {
  const AddPhoneInstrumentWidget({Key? key}) : super(key: key);

  @override
  _AddPhoneInstrumentWidgetState createState() =>
      _AddPhoneInstrumentWidgetState();
}

class _AddPhoneInstrumentWidgetState extends State<AddPhoneInstrumentWidget> {
  late AddPhoneInstrumentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPhoneInstrumentModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  _onAddPhoneInstrumentTap(BuildContext context,
      CurrentTransactionModel currentTransaction,
      List<PaymentInstrumentModel> paymentInstruments) async {
    //create a method to validate phone number
    if(!isPhoneNumberValid(
        _model.telecomSelectorModel.selectedNetworkName,
        _model.textController.text,
        paymentInstruments)) {
      return;
    }

    PaymentInstrumentModel paymentInstrument = PaymentInstrumentModel(
      id: '+243' + _model.textController.text,
      type: PayementInstrumentType.MOMO,
      organizationName: _model.telecomSelectorModel.selectedNetworkName?.value ?? '',
      productName: _model.telecomSelectorModel.selectedNetworkMoMo ?? '',
      accountNumber: '+243' + _model.textController.text,
      imageUrl: _model.telecomSelectorModel.selectedNetworkImageUrl ?? '',
    );
    currentTransaction.addPaymentInstrument(paymentInstrument);
    await FirestoreService().addPaymentInstrument(paymentInstrument);
    Navigator.pop(context);
  }

  showSnackBar(BuildContext context, String messageKey) {
    SnackBarUtils.showErrorSnackBar(context, messageKey);
  }

  _onSelectNetworkTap(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height:
            MediaQuery.of(context).size.height * 0.45,
            child:
            wrapWithModel(
              model: _model.telecomSelectorModel,
              updateCallback: () => setState(() {}),
              child: TelecomSelectorWidget(),
            ),
          ),
        );
      },
    ).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    CurrentTransactionModel currentTransaction = Provider.of<CurrentTransactionModel>(context);
    List<PaymentInstrumentModel> paymentInstruments = Provider.of<List<PaymentInstrumentModel>>(context);
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'nk7meo7x' /* Enter a number? */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '911nhcgc' /* Select network:  */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ADD_PHONE_INSTRUMENT_Container_cyugx7h9_');
                          logFirebaseEvent('Container_bottom_sheet');
                          await _onSelectNetworkTap(context);
                        },
                        child: Container(
                          width: 130.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFCBCBCB),
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 28.0,
                                  height: 28.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    _model.telecomSelectorModel.selectedNetworkImageUrl ?? '',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(_model.telecomSelectorModel.selectedNetworkName?.value ?? '',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'xc6581zs' /* Mobile money number: */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: FlutterFlowTheme.of(context).lineColor,
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    's6izsmq2' /* +243 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'zkj2jcdp' /* 992457388 */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFCBCBCB),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      suffixIcon: _model
                                              .textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.number,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ADD_PHONE_INSTRUMENT_COMP_ADD_BTN_ON_TAP');
                  logFirebaseEvent('Button_bottom_sheet');
                  _onAddPhoneInstrumentTap(context, currentTransaction, paymentInstruments);
                },
                text: FFLocalizations.of(context).getText(
                  'ute521ze' /* Add */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  isPhoneNumberValid(MomoTelecomOption? networkName,
      String phoneNumberText,
      List<PaymentInstrumentModel> paymentInstruments) {
    if (phoneNumberText.isEmpty) {
      showSnackBar(context, '1xq7xq7x');  /* Please enter a valid phone number */
      return false;
    }
    if (paymentInstruments.any((element) => element.accountNumber == '+243' + phoneNumberText)) {
      showSnackBar(context, 'old_phone_error'); /* Phone number is present already in use*/
      return;
    }
    if (networkName == null) {
      showSnackBar(context, '1xq7xq7x');
      return false;
    }
    switch (networkName) {
      case MomoTelecomOption.AIRTEL:
        if (!phoneNumberText.startsWith('93') &&
            !phoneNumberText.startsWith('94') &&
            !phoneNumberText.startsWith('95') &&
            !phoneNumberText.startsWith('97') &&
           ! phoneNumberText.startsWith('99')) {
          showSnackBar(context, 'airtel_error');
          return false;
        }
        break;
      case MomoTelecomOption.ORANGE:
        if (!phoneNumberText.startsWith('84') &&
            !phoneNumberText.startsWith('85') &&
            !phoneNumberText.startsWith('89')) {
          showSnackBar(context, 'orange_error');
          return false;
        }
        break;
      case MomoTelecomOption.VODACOM:
        if (!phoneNumberText.startsWith('81') && !phoneNumberText.startsWith('82')) {
          showSnackBar(context, 'vodacom_error');
          return false;
        }
        break;
      default:
        return false;
    }
    return true;
  }
}
