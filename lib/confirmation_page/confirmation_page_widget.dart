import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/vault_data_model.dart';
import 'package:provider/provider.dart';
import '../components/nav_back_button_widget.dart';
import '../components/transaction_details_widget.dart';
import '../firestore/firestore_service.dart';
import '../components/transaction_summary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirmation_page_model.dart';
export 'confirmation_page_model.dart';
import '/flutter_flow/flutter_flow_model.dart';

class ConfirmationPageWidget extends StatefulWidget {
  const ConfirmationPageWidget({Key? key}) : super(key: key);

  @override
  _ConfirmationPageWidgetState createState() => _ConfirmationPageWidgetState();
}

class _ConfirmationPageWidgetState extends State<ConfirmationPageWidget> {
  late ConfirmationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'confirmation_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  _onConfirmButtonTapped(BuildContext context, CurrentTransactionModel transactionModel) async {
    logFirebaseEvent(
        'CONFIRMATION_CONFIRM_AND_PAY_BTN_ON_TAP');
    logFirebaseEvent('Button_navigate_to');
    await FirestoreService().createTransaction(transactionModel);
    context.pushNamed(
      'success_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CurrentTransactionModel transactionModel = Provider.of<CurrentTransactionModel>(context);
    _model.transactionSummaryModel.transactionModel = transactionModel;
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
              titleKey: '7r65gheu' /* Confirmation */,
              firebaseEvent: 'CONFIRMATION_chevron_left_ICN_ON_TAP',
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.transactionSummaryModel,
                    updateCallback: () => setState(() {}),
                    child: TransactionSummaryWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _onConfirmButtonTapped(context, transactionModel);
                      },
                      text: FFLocalizations.of(context).getText(
                        'm4tvulyy' /* Confirm and pay */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryColor,
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
