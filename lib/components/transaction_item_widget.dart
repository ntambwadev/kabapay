import '../components/transaction_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionItemWidget extends StatefulWidget {
  const TransactionItemWidget({Key? key}) : super(key: key);

  @override
  _TransactionItemWidgetState createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
      child: InkWell(
        onTap: () async {
          logFirebaseEvent('TRANSACTION_ITEM_Container_3pf0lgjc_ON_T');
          logFirebaseEvent('Container_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: TransactionDetailsWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBtnText,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: FlutterFlowTheme.of(context).secondaryColor,
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'tfuogp09' /* 2022-09-08 1:52:35: PM */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/btc.png',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'nc374fp7' /* Received */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'v3z6xy0x' /* Pending */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
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
                              FFLocalizations.of(context).getText(
                                'tf19m68r' /* 20 USDT */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'm0o9ogso' /* $19.20 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
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