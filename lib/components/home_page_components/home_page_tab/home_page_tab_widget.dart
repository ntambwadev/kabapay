import 'package:kabapay/components/transaction_details_timeline.dart';

import '../../../models/current_transaction_model.dart';
import '/components/tokens/tokens_list/tokens_list_widget.dart';
import '/components/transactions/transactions_list/transactions_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

class _HomePageTabWidgetState extends State<HomePageTabWidget> with SingleTickerProviderStateMixin {
  late HomePageTabModel _model;
  late final _tabController = TabController(length: 2,vsync: this);

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
    Provider.of<CurrentTransactionModel>(context, listen: false).isTxCreationCompleted == true ? _tabController.animateTo(1) : _tabController.animateTo(0);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).backgroundcolor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: FlutterFlowTheme.of(context).primaryColor,
              unselectedLabelColor:
                  FlutterFlowTheme.of(context).secondaryText,
              labelPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              labelStyle: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
              indicatorColor: FlutterFlowTheme.of(context).primaryColor,
              indicatorWeight: 2.0,
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
                controller: _tabController,
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
    );
  }
}
