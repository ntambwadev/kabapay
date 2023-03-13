import '/components/home_page_components/home_page_balance/home_page_balance_widget.dart';
import '/components/home_page_components/home_page_buttons/home_page_buttons_widget.dart';
import '/components/home_page_components/home_page_tab/home_page_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for home_page_balance component.
  late HomePageBalanceModel homePageBalanceModel;
  // Model for home_page_buttons component.
  late HomePageButtonsModel homePageButtonsModel;
  // Model for home_page_tab component.
  late HomePageTabModel homePageTabModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homePageBalanceModel = createModel(context, () => HomePageBalanceModel());
    homePageButtonsModel = createModel(context, () => HomePageButtonsModel());
    homePageTabModel = createModel(context, () => HomePageTabModel());
  }

  void dispose() {
    homePageBalanceModel.dispose();
    homePageButtonsModel.dispose();
    homePageTabModel.dispose();
  }

  /// Additional helper methods are added here.

}
