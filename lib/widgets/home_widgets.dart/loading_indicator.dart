import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
