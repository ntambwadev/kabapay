import 'package:kabapay/models/current_transaction_model.dart';
import 'package:provider/provider.dart';

import '../components/add_phone_instrument_widget.dart';
import '../components/nav_back_button_widget.dart';
import '../components/phone_payment_method_item_widget.dart';
import '../components/tokens_list_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/payment_instrument_model.dart';
import 'payment_methods_page_model.dart';
export 'payment_methods_page_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class PaymentMethodsPageWidget extends StatefulWidget {
  const PaymentMethodsPageWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodsPageWidgetState createState() =>
      _PaymentMethodsPageWidgetState();
}

class _PaymentMethodsPageWidgetState extends State<PaymentMethodsPageWidget> {
  late PaymentMethodsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'payment_methods_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  _onSelectedPayment(BuildContext context, PaymentInstrumentModel paymentInstrument) async {
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .addPaymentInstrument(paymentInstrument);
    logFirebaseEvent(
        'PAYMENT_METHODS_Container_vzt3cso2_ON_TA');
    logFirebaseEvent(
        'phone_payment_method_item_navigate_to');

    context.pushNamed(
      'confirmation_page',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType:
          PageTransitionType.rightToLeft,
        ),
      },
    );
  }

  _onAddNewNumberButtonTapped(BuildContext context) async {
    logFirebaseEvent(
        'PAYMENT_METHODS_ADD_NEW_NUMBER_BTN_ON_TA');
    logFirebaseEvent('Button_bottom_sheet');
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 340,
            child: AddPhoneInstrumentWidget(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<PaymentInstrumentModel> paymentInstruments = Provider.of<List<PaymentInstrumentModel>>(context);

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: NavBackButtonWidget(
              titleKey: '9r7aauvp' /* How will you pay? */,
              firebaseEvent: 'PAYMENT_METHODS_chevron_left_ICN_ON_TAP',
              firebaseEvent2: 'IconButton_navigate_back',
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).backgroundcolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'br10fnam' /* Select your payment method */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            if (paymentInstruments.isEmpty) {
                              return Flexible(child: TokensListPlaceholderWidget());
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: paymentInstruments.length,
                              itemBuilder: (context, instrumentIndex) {
                                final instrumentItem = paymentInstruments[instrumentIndex];
                                return InkWell(
                                  onTap: () async {
                                    _onSelectedPayment(context, instrumentItem);
                                  },
                                  child: PhonePaymentMethodItemWidget(
                                    paymentInstrument: instrumentItem,
                                    key: Key(
                                        'Keyvzt_${instrumentIndex}_of_${paymentInstruments.length}'),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'lfjf7ceh' /* Or  */,
                            ),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 1.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _onAddNewNumberButtonTapped(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              'bcv1wdx6' /* Add new number */,
                            ),
                            icon: Icon(
                              Icons.add,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF42444C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
