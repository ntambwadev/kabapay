import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_button_model.dart';
export 'home_button_model.dart';

class HomeButtonWidget extends StatefulWidget {
  const HomeButtonWidget({Key? key}) : super(key: key);

  @override
  _HomeButtonWidgetState createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget> {
  late HomeButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_upward_outlined,
            color: Colors.black,
            size: 14.0,
          ),
          Text(
            FFLocalizations.of(context).getText(
              'tkmbhgt6' /* Send */,
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
