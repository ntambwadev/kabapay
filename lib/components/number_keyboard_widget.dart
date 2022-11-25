import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumberKeyboardWidget extends StatefulWidget {
  const NumberKeyboardWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final KeyboardTapCallback callback;

  @override
  _NumberKeyboardWidgetState createState() => _NumberKeyboardWidgetState();
}

class _NumberKeyboardWidgetState extends State<NumberKeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).backgroundcolor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k1,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 1');
                    widget.callback('1');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k2,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 2');
                    widget.callback('2');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k3,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 3');
                    widget.callback('3');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k4,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 4');
                    widget.callback('4');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k5,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 5');
                    widget.callback('5');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k6,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 6');
                    widget.callback('6');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k7,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 7');
                    widget.callback('7');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k8,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 8');
                    widget.callback('8');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k9,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 9');
                    widget.callback('9');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.kdot,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 1,
                  ),
                  onPressed: () {
                    print('IconButton pressed .');
                    widget.callback('.');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.k0,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed 0');
                    widget.callback('0');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 80,
                  icon: Icon(
                    FFIcons.kdelete,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 22,
                  ),
                  onPressed: () {
                    print('IconButton pressed back <');
                    widget.callback('<');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
