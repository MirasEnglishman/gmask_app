import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:gmask_app/network/dio/base/message_controller/message_controller.dart';

///Стандартная реализация [MessageController]
@injectable
class MaterialMessageController implements MessageController {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void show(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  @override
  void showError(String text) {
    if (text.isEmpty) {
      return;
    }
    final pattern = RegExp(r'[А-я]+');
    if (!pattern.hasMatch(text)) {
      if (text == "Too Many Attempts" || text.contains("Too Many Attempts")) {
        text = 'Количество запросов превышено. Пожалуйста, попробуйте позже';
      } else {
        text = 'Ошибка. Попробуйте позже';
      }
    }
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        // style: text700Size14WhiteOpenSans,
      ),
      // backgroundColor: errorColor,
    );
    show(snackBar);
  }

  @override
  void showInfo(String text) {
    // show(SnackBarBuilder.buildInfo(text));
  }

  @override
  void showSuccessful(String text) {
    if (text.isEmpty) {
      return;
    }
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
      ),
      // backgroundColor: successColor,
    );
    show(snackBar);
  }

  @override
  void showTopNotification(String text) {
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Row(
        children: [
          const Icon(
            Icons.check_circle,
            // color: successColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            // style: text600Size14BlackOpenSans,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    );
    show(snackBar);
  }

  void showNotificationReview(String text) {
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            // color: orangeColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            // style: text600Size14BlackOpenSans,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    );
    show(snackBar);
  }

  @override
  void showConfirmationInfo(String text) {
    // show(SnackBarBuilder.buildConfirmationInfo(text));
  }

  @override
  void showConfirmationSuccessful(String text) {
    // show(SnackBarBuilder.buildConfirmationSuccessful(text));
  }
}
