import 'package:kabapay/models/recipient_model.dart';

import '../../../models/current_transaction_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recipient_item_model.dart';
export 'recipient_item_model.dart';

class RecipientItemWidget extends StatefulWidget {
  const RecipientItemWidget({Key? key, required this.recipientModel}) : super(key: key);
  final RecipientModel recipientModel;

  @override
  _RecipientItemWidgetState createState() => _RecipientItemWidgetState();
}

class _RecipientItemWidgetState extends State<RecipientItemWidget> {
  late RecipientItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipientItemModel());
  }

  _onRecipientSelected(BuildContext context, RecipientModel recipientModel) {
    logFirebaseEvent('RECIPIENT_ITEM_Container_i943wwbj_ON_TAP');
    logFirebaseEvent('Container_navigate_to');

    Provider.of<CurrentTransactionModel>(context, listen: false)
        .addRecipient(recipientModel);
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .addRecipientAddress(recipientModel.walletAddress);
    context.pushNamed(
      'tokens_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 10.0),
      child: InkWell(
        onTap: () async {
          _onRecipientSelected(context, widget.recipientModel);
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 32.0,
                        height: 32.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/trust_wallet.png',
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
                              widget.recipientModel.fullName,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              widget.recipientModel.walletAddress,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 10.0,
                                  ),
                            ),
                            Text(
                              'Phone: ${widget.recipientModel.phoneNumber}',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 10.0,
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
