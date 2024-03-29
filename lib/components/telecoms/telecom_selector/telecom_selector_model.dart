import '../../../models/payment_instrument_model.dart';
import '/components/top_separator/top_separator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';

class TelecomSelectorModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for top_separator component.
  late TopSeparatorModel topSeparatorModel;
  MomoTelecomOption? selectedNetworkName = MomoTelecomOption.AIRTEL;
  String? selectedNetworkMoMo = 'Airtel Money';
  String? selectedNetworkImageUrl = 'assets/images/airtel-circle.png';
  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topSeparatorModel = createModel(context, () => TopSeparatorModel());
  }

  void dispose() {
    topSeparatorModel.dispose();
  }

  /// Additional helper methods are added here.

}
