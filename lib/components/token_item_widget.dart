import 'package:kabapay/models/token_model.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'token_item_model.dart';
export 'token_item_model.dart';

class TokenItemWidget extends StatefulWidget {
  const TokenItemWidget({Key? key, required this.token}) : super(key: key);
  final TokenModel token;

  @override
  _TokenItemWidgetState createState() => _TokenItemWidgetState();
}

class _TokenItemWidgetState extends State<TokenItemWidget> {
  late TokenItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TokenItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final priceChangePercent = widget.token.tokenMetadata.priceChangePercent24h.toString();
    bool isNegativePriceChange = priceChangePercent.contains('-');
    final priceChangePercentText = isNegativePriceChange
        ? '$priceChangePercent%' : '+$priceChangePercent%';
    Color priceChangeColor = isNegativePriceChange
        ? FlutterFlowTheme.of(context).loss
        : FlutterFlowTheme.of(context).gain;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBtnText,
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              color: Color(0xFFB8B8B8),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 12.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.token.tokenMetadata.image,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.token.tokenMetadata.symbol.toUpperCase(),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${widget.token.tokenMetadata.currentPrice} ',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                            ),
                      ),
                      Text(
                        priceChangePercentText,
                        style: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                          fontFamily: 'Poppins',
                          color: priceChangeColor,
                          fontSize: 9,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${double.parse(widget.token.amountUSD).toStringAsFixed(2)}',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        '${widget.token.amountToken} ${widget.token.symbol.toUpperCase()}',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
