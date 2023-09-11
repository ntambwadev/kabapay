import '/components/home_page_components/home_page_balance/home_page_balance_widget.dart';
import '/components/home_page_components/home_page_buttons/home_page_buttons_widget.dart';
import '/components/home_page_components/home_page_tab/home_page_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'home_page'});
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
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.homePageBalanceModel,
                      updateCallback: () => setState(() {}),
                      child: HomePageBalanceWidget(),
                    ),
                    wrapWithModel(
                      model: _model.homePageButtonsModel,
                      updateCallback: () => setState(() {}),
                      child: HomePageButtonsWidget(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.homePageTabModel,
                  updateCallback: () => setState(() {}),
                  child: HomePageTabWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
