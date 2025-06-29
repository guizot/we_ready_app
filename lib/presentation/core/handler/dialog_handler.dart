import 'package:flutter/material.dart';

class DialogHandler {

  static void showBottomSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // isDismissible: false,
      // enableDrag: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Wrap(
              children: [child]
            ),
          ),
        );
      },
    );

  }


  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? color
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? Theme.of(context).iconTheme.color,
        margin: const EdgeInsets.only(bottom: 80.0, left: 16.0, right: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }

}