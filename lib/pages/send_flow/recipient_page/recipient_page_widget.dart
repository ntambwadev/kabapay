import 'package:kabapay/models/recipient_model.dart';
import 'package:kabapay/utils/input_validator_utils.dart';

import '../../../components/nav_back_button/nav_back_button_widget.dart';
import '../../../firestore/firestore_service.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/../models/current_transaction_model.dart';
import 'recipient_page_model.dart';
export 'recipient_page_model.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:another_flushbar/flushbar.dart';

class RecipientPageWidget extends StatefulWidget {
  const RecipientPageWidget({Key? key}) : super(key: key);

  @override
  _RecipientPageWidgetState createState() => _RecipientPageWidgetState();
}

class _RecipientPageWidgetState extends State<RecipientPageWidget> {
  late RecipientPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipientPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'recipient_page'});
    _model.walletAdressController ??= TextEditingController();
    _model.fullNameController ??= TextEditingController();
    _model.phoneNumberController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  _onSendButtonTapped(BuildContext context) async {
    logFirebaseEvent(
        'RECIPIENT_PAGE_PAGE_CONTINUE_BTN_ON_TAP');
    logFirebaseEvent('Button_navigate_to');

    if(!_validateInput(context)) {
      return;
    }
    RecipientModel recipientModel = RecipientModel(
      walletAddress: _model.walletAdressController.text,
      fullName: _model.fullNameController.text,
      phoneNumber: _model.phoneNumberController.text,
    );

    // Provider.of<CurrentTransactionModel>(context, listen: false)
    //     .addRecipient(recipientModel);
    await FirestoreService().addRecipient(recipientModel);
    Navigator.pop(context);
  }

  _onScanQRCode(BuildContext context) async {
    logFirebaseEvent(
        'RECIPIENT_PAGE_PAGE_Icon_l7r27iv6_ON_TAP');
    logFirebaseEvent('Icon_close_dialog,_drawer,_etc');
    _model.walletAdressController.text =
    await FlutterBarcodeScanner.scanBarcode(
      '#C62828', // scanning line color
      'Cancel', // cancel button text
      true, // whether to show the flash icon
      ScanMode.QR,
    );
  }

  showSnackBar(BuildContext context, String messageKey) {
    Flushbar(
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      title:  FFLocalizations.of(context).getText('error_title',),
      message:  FFLocalizations.of(context).getText(messageKey,),
      duration:  Duration(seconds: 2),
    )..show(context);
  }

  bool _validateInput(BuildContext context) {
    if (!InputValidatorUtils.isAddressValidBep20(_model.walletAdressController.text)) {
      showSnackBar(context, 'wallet_address_invalid');
      return false;
    }
    if (!InputValidatorUtils.isValidFullName(_model.fullNameController.text)) {
      showSnackBar(context, 'name_invalid');
      return false;
    }
    if (!InputValidatorUtils.isValidNumber(_model.phoneNumberController.text)) {
      showSnackBar(context, 'phone_number_invalid');
      return false;
    }
    return true;
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
              titleKey: 'mrifrk2y' /* Recipient */,
              firebaseEvent: 'TOKENS_PAGE_PAGE_chevron_left_ICN_ON_TAP',
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
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'hjqrsgeh' /* Wallet address */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.walletAdressController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.walletAdressController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: FFLocalizations.of(context).getText(
                                  'do55n5r6' /* 0x473Adc04036b3c318aD4c18EF6C0 */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      lineHeight: 1.5,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                suffixIcon:
                                    _model.walletAdressController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.walletAdressController?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 18,
                                            ),
                                          )
                                        : null,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        lineHeight: 1.5,
                                      ),
                              maxLines: 2,
                              minLines: 1,
                              keyboardType: TextInputType.streetAddress,
                              validator: _model.walletAdressValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 5, 0),
                          child: InkWell(
                            onTap: () async {
                              _onScanQRCode(context);
                            },
                            child: Icon(
                              Icons.qr_code,
                              color: Colors.black,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'o8a13o07' /* Full name */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.fullNameController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.fullNameController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: FFLocalizations.of(context).getText(
                            'z9ovzo1e' /* Aime Tshibangu */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    lineHeight: 1.5,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          suffixIcon: _model.fullNameController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.fullNameController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 18,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              lineHeight: 1.5,
                            ),
                        maxLines: 2,
                        minLines: 1,
                        keyboardType: TextInputType.name,
                        validator:
                            _model.fullNameValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'lc09brsg' /* Mobile phone */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.phoneNumberController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.phoneNumberController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: FFLocalizations.of(context).getText(
                            '3r2nt6g2' /* +243992457388 */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    lineHeight: 1.5,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          suffixIcon: _model.phoneNumberController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.phoneNumberController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 18,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              lineHeight: 1.5,
                            ),
                        maxLines: 2,
                        minLines: 1,
                        keyboardType: TextInputType.name,
                        validator:
                            _model.phoneNumberValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _onSendButtonTapped(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'o2q4hy0a' /* Continue */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
