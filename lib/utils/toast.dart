import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ToastHelper {
  static void showSuccessToast(
      BuildContext context, String title, String message) {
    MotionToast.success(
      displayBorder: false,
      displaySideBar: false,
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 12),
      ),
      description: Text(
        message,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    ).show(context);
  }

  static void showErrorToast(
      BuildContext context, String title, String message) {
    MotionToast.error(
      displayBorder: false,
      displaySideBar: false,
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 12),
      ),
      description: Text(
        message,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    ).show(context);
  }

  static void showWarningToast(
      BuildContext context, String title, String message) {
    MotionToast.warning(
      displayBorder: false,
      displaySideBar: false,
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 12),
      ),
      description: Text(
        message,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    ).show(context);
  }

  static void showInfoToast(
      BuildContext context, String title, String message) {
    MotionToast.info(
      displayBorder: false,
      displaySideBar: false,
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 12),
      ),
      description: Text(
        message,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    ).show(context);
  }
}
