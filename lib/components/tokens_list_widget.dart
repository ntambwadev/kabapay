import 'package:kabapay/firestore/firestore_service.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:kabapay/models/user_model.dart';
import 'package:provider/provider.dart';

import '../components/token_item_widget.dart';
import '../components/tokens_list_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tokens_list_model.dart';
export 'tokens_list_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class TokensListWidget extends StatefulWidget {
  const TokensListWidget({Key? key}) : super(key: key);

  @override
  _TokensListWidgetState createState() => _TokensListWidgetState();
}

class _TokensListWidgetState extends State<TokensListWidget> {
  _onTokenSelected(BuildContext context, TokenModel tokenItem, UserModel? userModel) async {
    logFirebaseEvent('TOKENS_LIST_Container_ywi18osh_ON_TAP');
    logFirebaseEvent('token_item_navigate_to');
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .selectToken(tokenItem, userModel);
    context.pushNamed(
      'buy_token_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  late TokensListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TokensListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

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
          UserModel? userModel = Provider.of<UserModel?>(context);
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
                    _onTokenSelected(context, tokenItem, userModel);
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
