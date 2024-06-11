import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CustomMessage extends StatelessWidget {
  final String title;
  final String message;
  final ContentType contentType;

  CustomMessage({
    required this.message,
    required this.title,
    required this.contentType,
  });



  @override
  MaterialBanner build(BuildContext context) {
     return MaterialBanner(
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );
  }
}