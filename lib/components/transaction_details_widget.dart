import 'package:kabapay/components/transaction_details_timeline.dart';
import 'package:kabapay/models/transaction_model.dart';

import '../components/top_separator_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_details_model.dart';
export 'transaction_details_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lineColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TopSeparatorWidget(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TransactionDetailsTimeline(transactionModel: widget.transactionModel),
                Container(
                  width: double.infinity,
                  height: 340,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/usdt.png',
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'o1hg2c4w' /* 100 USDT */,
                                ),
                                style:
                                    FlutterFlowTheme.of(context).title3.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF21BF73),
                                        ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '65lx7y6n' /* Payment method */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ud47rs8x' /* MPesa */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ry8sp7jr' /* Mobile money number */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'xzxm13ky' /* 0971504436 */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'dx5z3y16' /* You pay */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'g77605sg' /* $100 USD */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'x7my7d1b' /* You receive */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/usdt.png',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'jztot544' /* 100 USDT */,
                                    ),
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ra5ua0p4' /* Transaction fees */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'bk0h6u8c' /* $0.05 USD */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'smcd6ix8' /* Total */,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'r2jau6jx' /* $100.05 USD */,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
