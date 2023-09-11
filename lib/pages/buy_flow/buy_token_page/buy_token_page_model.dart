import '/components/buy_token_page_components/buy_token_amount/buy_token_amount_widget.dart';
import '/components/buy_token_page_components/buy_token_next_button/buy_token_next_button_widget.dart';
import '/components/buy_token_page_components/number_keyboard/number_keyboard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuyTokenPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for buy_token_amount component.
  late BuyTokenAmountModel buyTokenAmountModel;
  // Model for number_keyboard component.
  late NumberKeyboardModel numberKeyboardModel;
  // Model for buy_token_next_button component.
  late BuyTokenNextButtonModel buyTokenNextButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buyTokenAmountModel = createModel(context, () => BuyTokenAmountModel());
    numberKeyboardModel = createModel(context, () => NumberKeyboardModel());
    buyTokenNextButtonModel =
        createModel(context, () => BuyTokenNextButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buyTokenAmountModel.dispose();
    numberKeyboardModel.dispose();
    buyTokenNextButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
