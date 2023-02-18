import 'package:kabapay/components/top_separator_model.dart';

import '../components/top_separator_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_model.dart';

class ReceiveTokenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for top_separator component.
  late TopSeparatorModel topSeparatorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topSeparatorModel = createModel(context, () => TopSeparatorModel());
  }

  void dispose() {
    topSeparatorModel.dispose();
  }

  /// Additional helper methods are added here.

}
