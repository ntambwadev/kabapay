import '../components/token_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TokensListWidget extends StatefulWidget {
  const TokensListWidget({Key? key}) : super(key: key);

  @override
  _TokensListWidgetState createState() => _TokensListWidgetState();
}

class _TokensListWidgetState extends State<TokensListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () async {
              context.pushNamed(
                'buy_token_page',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
            child: TokenItemWidget(),
          ),
        ],
      ),
    );
  }
}
