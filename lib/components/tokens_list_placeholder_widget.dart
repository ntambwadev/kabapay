import 'package:kabapay/models/token_model.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TokensListPlaceholderWidget extends StatefulWidget {
  const TokensListPlaceholderWidget({Key? key}) : super(key: key);

  @override
  _TokensListPlaceholderWidgetState createState() =>
      _TokensListPlaceholderWidgetState();
}

class _TokensListPlaceholderWidgetState
    extends State<TokensListPlaceholderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie_animations/loading-crypto.json',
                width: MediaQuery.of(context).size.width * 0.5,
                height: 200,
                fit: BoxFit.cover,
                animate: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
