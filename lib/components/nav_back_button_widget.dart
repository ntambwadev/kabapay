import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_back_button_model.dart';
export 'nav_back_button_model.dart';

class NavBackButtonWidget extends StatefulWidget {
  const NavBackButtonWidget({Key? key, this.titleKey = "", required this.firebaseEvent, required this.firebaseEvent2}) : super(key: key);
  final String titleKey;
  final String firebaseEvent;
  final String firebaseEvent2;
  @override
  _NavBackButtonWidgetState createState() => _NavBackButtonWidgetState();
}

class _NavBackButtonWidgetState extends State<NavBackButtonWidget> {
  late NavBackButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBackButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(widget.firebaseEvent);
                    logFirebaseEvent(widget.firebaseEvent2);
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              widget.titleKey /* 'dqz8qdg4'  Confirm your code */,
            ),
            style: FlutterFlowTheme.of(context).title1,
          ),
        ),
      ],
    );
  }
}
