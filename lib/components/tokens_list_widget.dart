import 'package:kabapay/firestore/firestore_service.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:provider/provider.dart';

import '../components/token_item_widget.dart';
import '../components/tokens_list_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
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
        color: FlutterFlowTheme.of(context).lineColor,
      ),
      child: Builder(
        builder: (context) {
          List<TokenModel> tokens = Provider.of<List<TokenModel>>(context);
          if (tokens.isEmpty) {
            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: TokensListPlaceholderWidget(),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              //TODO refresh tokens list with new values
            },
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: tokens.length,
              itemBuilder: (context, tokenIndex) {
                final tokenItem = tokens[tokenIndex];
                return InkWell(
                  onTap: () async {
                    logFirebaseEvent('TOKENS_LIST_Container_ywi18osh_ON_TAP');
                    logFirebaseEvent('token_item_navigate_to');

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
                  child: TokenItemWidget(
                    key: UniqueKey(),
                    token: tokenItem,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
