import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'edit_profile'});
    _model.yourNameController ??= TextEditingController();
    _model.cityController ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 28.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_PROFILE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5lhizk3m' /* Edit profile */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDBE2E7),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 2.0, 2.0, 2.0),
                          child: Container(
                            width: 90.0,
                            height: 90.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                random_data.randomImageUrl(
                                  0,
                                  0,
                                ),
                                '/test',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.yourNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'xi0b31v4' /* Your Name */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.yourNameControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.cityController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'o8g4bc9p' /* Your City */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.cityControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.stateValueController ??=
                        FormFieldController<String>(
                      _model.stateValue ??= FFLocalizations.of(context).getText(
                        'v3lzdrso' /* State */,
                      ),
                    ),
                    options: [
                      FFLocalizations.of(context).getText(
                        'm5int8i9' /* State */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2t8fy758' /* Alabama */,
                      ),
                      FFLocalizations.of(context).getText(
                        '8mw7x1aq' /* Alaska */,
                      ),
                      FFLocalizations.of(context).getText(
                        'lmd11anj' /* Arizona */,
                      ),
                      FFLocalizations.of(context).getText(
                        '50nj3ajx' /* Arkansas */,
                      ),
                      FFLocalizations.of(context).getText(
                        'o7yqp2tw' /* California */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ox7xsttx' /* Colorado */,
                      ),
                      FFLocalizations.of(context).getText(
                        'yql130io' /* Connecticut */,
                      ),
                      FFLocalizations.of(context).getText(
                        'cni7bxpl' /* Delaware */,
                      ),
                      FFLocalizations.of(context).getText(
                        'mf6embu9' /* Florida */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jz3fxv8s' /* Georgia */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3o34gp01' /* Hawaii */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3yo13a86' /* Idaho */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ibc33c8b' /* Illinoi */,
                      ),
                      FFLocalizations.of(context).getText(
                        'u0mnfx3y' /* Indiana */,
                      ),
                      FFLocalizations.of(context).getText(
                        'vqxwt66y' /* Iowa */,
                      ),
                      FFLocalizations.of(context).getText(
                        'l5oj3349' /* Kansas */,
                      ),
                      FFLocalizations.of(context).getText(
                        's1fx9bcw' /* Kentucky */,
                      ),
                      FFLocalizations.of(context).getText(
                        'e7odtij1' /* Louisiana */,
                      ),
                      FFLocalizations.of(context).getText(
                        'rctcltye' /* Maine */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ju53hqh4' /* Maryland */,
                      ),
                      FFLocalizations.of(context).getText(
                        'm7ifgrer' /* Massachusetts */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zin9klxz' /* Michigan */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a6xnnhbs' /* Minnesota */,
                      ),
                      FFLocalizations.of(context).getText(
                        'v41dhhz3' /* Mississippi */,
                      ),
                      FFLocalizations.of(context).getText(
                        'pzbkly96' /* Missouri */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zvtdleka' /* Monta */,
                      ),
                      FFLocalizations.of(context).getText(
                        'd4d4dj6z' /* Nebraska */,
                      ),
                      FFLocalizations.of(context).getText(
                        '4qdm3quu' /* Nevada */,
                      ),
                      FFLocalizations.of(context).getText(
                        'pviwvfib' /* New Hampshire */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xjtof912' /* New Jersey */,
                      ),
                      FFLocalizations.of(context).getText(
                        'uxo7rglz' /* New Mexico */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hgbr152p' /* New York */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0h72awkb' /* North Carolina */,
                      ),
                      FFLocalizations.of(context).getText(
                        'yfjqm8zc' /* North Dak */,
                      ),
                      FFLocalizations.of(context).getText(
                        'of8fp4w3' /* Ohio */,
                      ),
                      FFLocalizations.of(context).getText(
                        'm1qakh0k' /* Oklahoma */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ti4qm885' /* Oregon */,
                      ),
                      FFLocalizations.of(context).getText(
                        '7ditk5a8' /* Pennsylvani */,
                      ),
                      FFLocalizations.of(context).getText(
                        'z2ysxcz6' /* Rhode Island */,
                      ),
                      FFLocalizations.of(context).getText(
                        'eivrltat' /* South Caroli */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ybysp69p' /* South Dakota */,
                      ),
                      FFLocalizations.of(context).getText(
                        'gttazu7k' /* Tennessee */,
                      ),
                      FFLocalizations.of(context).getText(
                        'kl2dgkwl' /* Texas */,
                      ),
                      FFLocalizations.of(context).getText(
                        'mtvgpddy' /* Utah */,
                      ),
                      FFLocalizations.of(context).getText(
                        'lz1f7qxh' /* Vermont */,
                      ),
                      FFLocalizations.of(context).getText(
                        'phy18qgu' /* Virginia */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jrye5f9f' /* Washingto */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ceq0fb5k' /* West Virginia */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hxo4cwwi' /* Wisconsin */,
                      ),
                      FFLocalizations.of(context).getText(
                        'esxzr8o1' /* Wyoming */,
                      )
                    ],
                    onChanged: (val) => setState(() => _model.stateValue = val),
                    width: double.infinity,
                    height: 56.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'meuw9xew' /* Select State */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: TextFormField(
                    controller: _model.myBioController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: FFLocalizations.of(context).getText(
                        'a1fum1c0' /* Your bio */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    validator:
                        _model.myBioControllerValidator.asValidator(context),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '8sjxsk4k' /* Save Changes */,
                      ),
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
