import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/internationalization.dart';

class SnackBarUtils {
  static void showErrorSnackBar(BuildContext context, String messageKey) {
    Flushbar(
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      title:  FFLocalizations.of(context).getText('warning_title',),
      message:  FFLocalizations.of(context).getText(messageKey,),
      duration:  Duration(seconds: 2),
    )..show(context);
  }

  static void showWarningSnackBar(BuildContext context, String messageKey) {
    Flushbar(
      backgroundColor: Colors.orange,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration:  Duration(seconds: 3),
      titleText: Text(
        FFLocalizations.of(context).getText('warning_title',),
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      messageText: Text(
        FFLocalizations.of(context).getText(messageKey,),
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    )..show(context);
  }

  static void showPayToNumberMessageSnackBar(BuildContext context, String vaultPaymentAcountNumber) {
    Flushbar(
      backgroundColor: Colors.black,
      margin: EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      titleText: Text(
        FFLocalizations.of(context).getText('pay_toast_title',),
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      messageText: Text(
        vaultPaymentAcountNumber,
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      duration:  Duration(seconds: 2),
    )..show(context);

    // ANOTHER WAY TO SHOW SNACKBAR FROM THE TOP
    // showTopSnackBar(
    //   Overlay.of(context)!,
    //   CustomSnackBar.info(
    //     message:
    //     "Veuille envoyer le montant au numéro de compte que vous venez de copier",
    //   ),
    // );
  }

  static void showCopyAddressSnackBar(BuildContext context, String userAddress) {
    Flushbar(
      backgroundColor: Colors.black,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      title:  FFLocalizations.of(context).getText('toast_title',),
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
  }

  static void showCopyMessageSnackBar(BuildContext context, String titleKey, String message) {
    Flushbar(
      backgroundColor: Colors.black,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      title:  FFLocalizations.of(context).getText(titleKey,),
      message:  FFLocalizations.of(context).getText(message,),
      messageText: Text(
        message,
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      duration:  Duration(seconds: 2),
    )..show(context);
  }
}