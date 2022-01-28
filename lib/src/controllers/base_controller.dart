import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class BaseController {
  final double _snackbarPadding = 8.r;
  final double _snackbarMargin = 8.r;
  final double _snackbarBoaderRadius = 8.r;
  final double _snackbarFontSize = 12.r;

  SnackBar _snackBar(
          {required String message,
          required Color fontColor,
          required Color backgroundColor}) =>
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: fontColor,
            fontSize: _snackbarFontSize,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: 2.0,
        margin: EdgeInsets.all(_snackbarMargin),
        padding: EdgeInsets.all(_snackbarPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_snackbarBoaderRadius),
        ),
      );

  showErrorSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _snackBar(
        message: message,
        fontColor: colorWhite,
        backgroundColor: colorRed,
      ),
    );
  }

  showSuccessSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _snackBar(
        message: message,
        fontColor: colorWhite,
        backgroundColor: colorBackground,
      ),
    );
  }

  // showBanner(
  //   BuildContext context,
  //   String message,
  // ) {
  //   ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
  //     content: Text(
  //       message,
  //       style: TextStyle(
  //         color: colorBackground,
  //         fontSize: _snackbarFontSize,
  //       ),
  //     ),
  //     backgroundColor: Colors.white,
  //     elevation: 2.0,
  //     actions: [
  //       IconButton(onPressed: () {}, icon: Icon(Icons.headphones)),
  //       IconButton(onPressed: () {}, icon: Icon(Icons.headphones)),
  //       IconButton(
  //           onPressed: () {
  //             ScaffoldMessenger.of(context).clearMaterialBanners();
  //           },
  //           icon: Icon(Icons.close)),
  //     ],
  //     padding: EdgeInsets.all(_snackbarPadding),
  //   ));
  // }

  Future showBusy(BuildContext context,
      {required Future Function() function}) async {
    showDialog(
        context: context,
        barrierColor: colorBackground.withOpacity(0.8),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              color: colorGreen,
              strokeWidth: 2.0,
            ),
          );
        });
    await function.call();
    Navigator.maybePop(context);
  }
}
