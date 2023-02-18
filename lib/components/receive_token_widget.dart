import 'dart:async';
import 'dart:ui' as ui;

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../auth/auth_util.dart';
import '../components/top_separator_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'receive_token_model.dart';
export 'receive_token_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class ReceiveTokenWidget extends StatefulWidget {
  const ReceiveTokenWidget({Key? key}) : super(key: key);

  @override
  _ReceiveTokenWidgetState createState() => _ReceiveTokenWidgetState();
}

class _ReceiveTokenWidgetState extends State<ReceiveTokenWidget> {
  var userAddress = valueOrDefault(currentUserDocument?.address, '');

  _copyToClipboard() async {
    Clipboard.setData(new ClipboardData(text: userAddress)).then((_){
      Flushbar(
        backgroundColor: Colors.black,
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        title:  FFLocalizations.of(context).getText('toast_title',), /* Please enter an amount */
        message:  FFLocalizations.of(context).getText(userAddress,),
        messageText: Text(
          userAddress,
          style: GoogleFonts.getFont(
            'Poppins',
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        duration:  Duration(seconds: 2),
      )..show(context);
    });
  }
  late ReceiveTokenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceiveTokenModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        final size = 150.0;
        if (!snapshot.hasData) {
          return Container(width: size, height: size);
        }
        return CustomPaint(
          size: Size.square(size),
          painter: QrPainter(
            data: userAddress,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.black,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Colors.black,
            ),
            embeddedImage: snapshot.data,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size.square(42),
            ),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).backgroundcolor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopSeparatorWidget(),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'bjys7lu3' /* Receive  */,
                      ),
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'd5ox0e1u' /* Copy or Scan your BSC wallet a... */,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 40, 40, 40),
                        child: InkWell(
                          onTap: () async {
                            _copyToClipboard();
                          },
                          child: Container(
                            width: 200,
                            height: 200,
                            child: qrFutureBuilder,
                          ),
                        )
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'lg2pfm1k' /* Send only binance BEP20 token ... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'RECEIVE_TOKEN_0X123GHXFFKJSDS_BTN_ON_TAP');
                          logFirebaseEvent('Button_bottom_sheet');
                          _copyToClipboard();
                        },
                        text: FFLocalizations.of(context).getText(
                          'ip7tqqd4' /* 0x123ghxffkjsds */,
                        ),
                        icon: Icon(
                          Icons.content_copy_outlined,
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 220,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/vlogo.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
