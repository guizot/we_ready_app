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

  static void showConfirmDialog({
    required BuildContext context,
    required String title,
    required String description,
    required String confirmText,
    required VoidCallback onConfirm,
  }) {
    showBottomSheet(
      context: context,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 5.0,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).hoverColor,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              const SizedBox(height: 18.0),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: onConfirm,
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).iconTheme.color,
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: Text(confirmText),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

