import '/components/home_page_components/home_button/home_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageButtonsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for home_button component.
  late HomeButtonModel homeButtonModel1;
  // Model for home_button component.
  late HomeButtonModel homeButtonModel2;
  // Model for home_button component.
  late HomeButtonModel homeButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel1 = createModel(context, () => HomeButtonModel());
    homeButtonModel2 = createModel(context, () => HomeButtonModel());
    homeButtonModel3 = createModel(context, () => HomeButtonModel());
  }

  void dispose() {
    homeButtonModel1.dispose();
    homeButtonModel2.dispose();
    homeButtonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
