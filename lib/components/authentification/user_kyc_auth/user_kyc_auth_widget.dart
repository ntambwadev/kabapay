import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_kyc_auth_model.dart';
export 'user_kyc_auth_model.dart';

class UserKycAuthWidget extends StatefulWidget {
  const UserKycAuthWidget({Key? key}) : super(key: key);

  @override
  _UserKycAuthWidgetState createState() => _UserKycAuthWidgetState();
}

class _UserKycAuthWidgetState extends State<UserKycAuthWidget> {
  late UserKycAuthModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserKycAuthModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5i509a64' /* Identification */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: FlutterFlowCreditCardForm(
                      formKey: _model.creditCardFormKey,
                      creditCardModel: _model.creditCardInfo,
                      obscureNumber: true,
                      obscureCvv: false,
                      spacing: 10.0,
                      textStyle: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      inputDecoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF9E9E9E),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF9E9E9E),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  Switch(
                    value: _model.switchValue ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue = newValue!);
                    },
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'kqqcxytd' /* Wallet address */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
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
                    controller: _model.textController1,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController1',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: FFLocalizations.of(context).getText(
                        'cl040q0x' /* 0x473Adc04036b3c318aD4c18EF6C0 */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                lineHeight: 1.5,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      suffixIcon: _model.textController1!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController1?.clear();
                                setState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 18.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          lineHeight: 1.5,
                        ),
                    maxLines: 2,
                    minLines: 1,
                    keyboardType: TextInputType.streetAddress,
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 5.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('USER_KYC_AUTH_COMP_Icon_hdxz38z6_ON_TAP');
                    logFirebaseEvent('Icon_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.qr_code,
                    color: Colors.black,
                    size: 32.0,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'cgfnd95j' /* Full name */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextFormField(
              controller: _model.textController2,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController2',
                Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                hintText: FFLocalizations.of(context).getText(
                  'cn24ee90' /* Aime Tshibangu */,
                ),
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      lineHeight: 1.5,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                suffixIcon: _model.textController2!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.textController2?.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFF757575),
                          size: 18.0,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    lineHeight: 1.5,
                  ),
              maxLines: 2,
              minLines: 1,
              keyboardType: TextInputType.name,
              validator: _model.textController2Validator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'ggn02brh' /* Mobile phone */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextFormField(
              controller: _model.textController3,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController3',
                Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                hintText: FFLocalizations.of(context).getText(
                  's0mgtq15' /* +243992457388 */,
                ),
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      lineHeight: 1.5,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                suffixIcon: _model.textController3!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.textController3?.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFF757575),
                          size: 18.0,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    lineHeight: 1.5,
                  ),
              maxLines: 2,
              minLines: 1,
              keyboardType: TextInputType.name,
              validator: _model.textController3Validator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('USER_KYC_AUTH_COMP_CONTINUE_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(
                  'tokens_page',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.rightToLeft,
                    ),
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                '0ir4unyl' /* Continue */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Color(0xFF95A1AC),
            ),
            child: CheckboxListTile(
              value: _model.checkboxListTileValue ??= true,
              onChanged: (newValue) async {
                setState(() => _model.checkboxListTileValue = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'a1pv11o6' /* Title */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'hmmb48dr' /* Subtitle */,
                ),
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
              tileColor: Color(0xFFF5F5F5),
              activeColor: FlutterFlowTheme.of(context).primary,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
          SwitchListTile(
            value: _model.switchListTileValue ??= true,
            onChanged: (newValue) async {
              setState(() => _model.switchListTileValue = newValue!);
            },
            title: Text(
              FFLocalizations.of(context).getText(
                '64ltmh5o' /* Title */,
              ),
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            subtitle: Text(
              FFLocalizations.of(context).getText(
                'rbhsubio' /* Subtitle */,
              ),
              style: FlutterFlowTheme.of(context).titleSmall,
            ),
            tileColor: FlutterFlowTheme.of(context).loss,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          FlutterFlowLanguageSelector(
            width: 200.0,
            backgroundColor: Colors.black,
            borderColor: Color(0xFF262D34),
            dropdownIconColor: Color(0xFF14181B),
            borderRadius: 8.0,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
            hideFlags: false,
            flagSize: 24.0,
            flagTextGap: 8.0,
            currentLanguage: FFLocalizations.of(context).languageCode,
            languages: FFLocalizations.languages(),
            onChanged: (lang) => setAppLanguage(context, lang),
          ),
        ],
      ),
    );
  }
}
