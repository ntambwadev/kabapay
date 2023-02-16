import '../components/nav_back_button_widget.dart';
import '../components/tokens_list_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tokens_page_model.dart';
export 'tokens_page_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class TokensPageWidget extends StatefulWidget {
  const TokensPageWidget({
    Key? key,
    this.flowType,
  }) : super(key: key);

  final String? flowType;

  @override
  _TokensPageWidgetState createState() => _TokensPageWidgetState();
}

class _TokensPageWidgetState extends State<TokensPageWidget> {
  late TokensPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TokensPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tokens_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: NavBackButtonWidget(
              titleKey: '4dfo553x' /* Tokens */,
              firebaseEvent: 'TOKENS_PAGE_PAGE_chevron_left_ICN_ON_TAP',
              firebaseEvent2: 'IconButton_navigate_back',
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: wrapWithModel(
                model: _model.tokensListModel,
                updateCallback: () => setState(() {}),
                child: TokensListWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
