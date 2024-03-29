import 'package:kabapay/models/transaction_model.dart';
import '/components/transactions/transaction_details/transaction_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_item_model.dart';
export 'transaction_item_model.dart';
import '/flutter_flow/flutter_flow_model.dart';

class TransactionItemWidget extends StatefulWidget {
  const TransactionItemWidget({Key? key, required this.transaction}) : super(key: key);
  final TransactionModel transaction;

  @override
  _TransactionItemWidgetState createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  late TransactionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('TransactionModel.events: ${widget.transaction.events}');
    final amountTokenText = '${widget.transaction.amountToken} ${widget.transaction.token?.symbol.toUpperCase()}';
    final amountUSDText = '\$${widget.transaction.amountUSD}';
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 10.0),
      child: InkWell(
        onTap: () async {
          logFirebaseEvent('TRANSACTION_ITEM_Container_3pf0lgjc_ON_T');
          logFirebaseEvent('Container_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: TransactionDetailsWidget(transactionModel: widget.transaction),
                ),
              );
            },
          );
        },
        child: Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBtnText,
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                color: FlutterFlowTheme.of(context).secondaryColor,
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.transaction.createdAt ?? '',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 32.0,
                        height: 32.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          widget.transaction.token?.tokenMetadata.image ?? ''
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${FFLocalizations.of(context).getText(widget.transaction.type?.descriptionKey ?? '')} '
                                  '${widget.transaction.token?.tokenMetadata.name}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).primaryText,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                widget.transaction.status?.descriptionKey ?? '',
                              ),
                              style:
                                  FlutterFlowTheme.of(context).bodyText2.override(
                                        fontFamily: 'Poppins',
                                        color: widget.transaction.status?.color,
                                        fontSize: 10,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              amountTokenText,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).primaryText,
                                    fontSize: 12,
                                  ),
                            ),
                            Text(
                              amountUSDText,
                              style:
                                  FlutterFlowTheme.of(context).bodyText2.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
