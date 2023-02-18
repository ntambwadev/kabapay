import '../components/tokens_list_widget.dart';
import '../components/transactions_list_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_tab_model.dart';
export 'home_page_tab_model.dart';

class HomePageTabWidget extends StatefulWidget {
  const HomePageTabWidget({Key? key}) : super(key: key);

  @override
  _HomePageTabWidgetState createState() => _HomePageTabWidgetState();
}

class _HomePageTabWidgetState extends State<HomePageTabWidget> {
  late HomePageTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTabModel());
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
        color: FlutterFlowTheme.of(context).backgroundcolor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: FlutterFlowTheme.of(context).primaryColor,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                labelPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                labelStyle: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                indicatorColor: FlutterFlowTheme.of(context).primaryColor,
                indicatorWeight: 2,
                tabs: [
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '3k4uw7qb' /* Tokens */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'fx56ak9t' /* Transactions */,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    wrapWithModel(
                      model: _model.tokensListModel,
                      updateCallback: () => setState(() {}),
                      child: TokensListWidget(),
                    ),
                    wrapWithModel(
                      model: _model.transactionsListModel,
                      updateCallback: () => setState(() {}),
                      child: TransactionsListWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
