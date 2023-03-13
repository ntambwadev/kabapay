import '/components/recipients/recipient_list/recipient_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectRecipientPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for recipient_list component.
  late RecipientListModel recipientListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    recipientListModel = createModel(context, () => RecipientListModel());
  }

  void dispose() {
    recipientListModel.dispose();
  }

  /// Additional helper methods are added here.

}
