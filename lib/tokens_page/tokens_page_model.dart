import '../components/tokens_list_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TokensPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for tokens_list component.
  late TokensListModel tokensListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tokensListModel = createModel(context, () => TokensListModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
