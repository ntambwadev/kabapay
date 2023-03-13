import 'package:kabapay/models/payment_instrument_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_payment_method_item_model.dart';
export 'phone_payment_method_item_model.dart';
import '/flutter_flow/flutter_flow_model.dart';

class PhonePaymentMethodItemWidget extends StatefulWidget {
  const PhonePaymentMethodItemWidget({Key? key, required this.paymentInstrument}) : super(key: key);
  final PaymentInstrumentModel paymentInstrument;

  @override
  _PhonePaymentMethodItemWidgetState createState() =>
      _PhonePaymentMethodItemWidgetState();
}

class _PhonePaymentMethodItemWidgetState
    extends State<PhonePaymentMethodItemWidget> {
  late PhonePaymentMethodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhonePaymentMethodItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryColor,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Container(
                width: 44.0,
                height: 44.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  widget.paymentInstrument.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.paymentInstrument.accountNumber,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Text(widget.paymentInstrument.organizationName,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
