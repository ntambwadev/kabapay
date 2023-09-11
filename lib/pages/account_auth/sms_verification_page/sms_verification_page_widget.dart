import '/auth/firebase_auth/auth_util.dart';
import '/components/nav_back_button/nav_back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sms_verification_page_model.dart';
export 'sms_verification_page_model.dart';

class SmsVerificationPageWidget extends StatefulWidget {
  const SmsVerificationPageWidget({Key? key}) : super(key: key);

  @override
  _SmsVerificationPageWidgetState createState() =>
      _SmsVerificationPageWidgetState();
}

class _SmsVerificationPageWidgetState extends State<SmsVerificationPageWidget> {
  late SmsVerificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmsVerificationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'sms_verification_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: wrapWithModel(
                model: _model.navBackButtonModel,
                updateCallback: () => setState(() {}),
                child: NavBackButtonWidget(),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ojco3nk2' /* This code helps keep your acco... */,
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        enablePinAutofill: true,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        obscureText: false,
                        hintCharacter: '-',
                        pinTheme: PinTheme(
                          fieldHeight: 60.0,
                          fieldWidth: 60.0,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(12.0),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          inactiveColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          activeFillColor: FlutterFlowTheme.of(context).primary,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'SMS_VERIFICATION_CONFIRM_&_CONTINUE_BTN_');
                          logFirebaseEvent('Button_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final smsCodeVal = _model.pinCodeController!.text;
                          if (smsCodeVal == null || smsCodeVal.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Enter SMS verification code.'),
                              ),
                            );
                            return;
                          }
                          final phoneVerifiedUser =
                              await authManager.verifySmsCode(
                            context: context,
                            smsCode: smsCodeVal,
                          );
                          if (phoneVerifiedUser == null) {
                            return;
                          }

                          context.goNamedAuth('home_page', context.mounted);
                        },
                        text: FFLocalizations.of(context).getText(
                          'fd8yh3cc' /* Confirm & Continue */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
