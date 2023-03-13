import 'package:kabapay/components/CustomTimelineWidget.dart';
import 'package:kabapay/firestore/firestore_service.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import '/components/transactions/payment_instructions/payment_instructions_widget.dart';
import '/components/transactions/transaction_summary/transaction_summary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_details_model.dart';
export 'transaction_details_model.dart';
import '/flutter_flow/flutter_flow_model.dart';

class TransactionDetailsWidget extends StatefulWidget {
  const TransactionDetailsWidget({Key? key, required this.transactionModel}) : super(key: key);
  final TransactionModel transactionModel;

  @override
  _TransactionDetailsWidgetState createState() =>
      _TransactionDetailsWidgetState();
}

class _TransactionDetailsWidgetState extends State<TransactionDetailsWidget> {
  late TransactionDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionDetailsModel());
    _model.transactionSummaryModel.transactionModel = widget.transactionModel;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  _onCancelTransaction() async {
    logFirebaseEvent(
        'TRANSACTION_DETAILS_CANCEL_BTN_ON_TAP');
    logFirebaseEvent('Button_navigate_to');
    FirestoreService().cancelTransaction(widget.transactionModel);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lineColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'j4tcradb' /* Transaction Details */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (widget.transactionModel.type == TransactionType.BUY
                      && (widget.transactionModel?.status == TransactionStatus.PAYIN_TRANSACTION_CREATED
                      || widget.transactionModel?.status == TransactionStatus.PAYIN_WAITING_FOR_USER_PAYMENT))
                    wrapWithModel(
                      model: _model.paymentInstructionsModel,
                      updateCallback: () => setState(() {}),
                      child: PaymentInstructionsWidget(transactionModel: widget.transactionModel),
                    ),
                  wrapWithModel(
                    model: _model.transactionSummaryModel,
                    updateCallback: () => setState(() {}),
                    child: TransactionSummaryWidget(),
                  ),
                  CustomTimelineWidget(events: widget.transactionModel?.events ?? []),
                  if(widget.transactionModel?.status?.index != 4 && widget.transactionModel?.status?.index != 5 && widget.transactionModel?.status?.index != 6)
                    Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _onCancelTransaction();
                      },
                      text: FFLocalizations.of(context).getText(
                        'dzxvejah' /* Cancel */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).loss,
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
          ],
        ),
      ),
    );
  }
}
