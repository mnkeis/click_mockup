// ignore_for_file: inference_failure_on_function_invocation, inference_failure_on_function_return_type

import 'package:click_mockup/widgets/dialogs/dialog_calendar.dart';
import 'package:click_mockup/widgets/dialogs/dialog_confirm.dart';
import 'package:click_mockup/widgets/dialogs/dialog_generic.dart';
import 'package:click_mockup/widgets/dialogs/dialog_loading.dart';
import 'package:click_mockup/widgets/dialogs/dialog_request.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> loading(
    BuildContext context,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return const DialogLoading();
      },
    );
  }

  static Future<void> generic(
    BuildContext context, {
    String image = '',
    String title = '',
    String subTitle = '',
    String textButton = '',
    VoidCallback? onConfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogGeneric(
          image: image,
          title: title,
          subTitle: subTitle,
          textButton: textButton,
          onConfirm: onConfirm ?? () {},
        );
      },
    );
  }

  static Future<void> confirm(
    BuildContext context, {
    required String title,
    String subTitle = '',
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogConfirm(
          title: title,
          subTitle: subTitle,
        );
      },
    );
  }

  static Future<void> request(
    BuildContext context, {
    required String title,
    String subTitle = '',
    Widget? body,
    String? textButton,
    VoidCallback? onComfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogRequest(
          title: title,
          subTitle: subTitle,
          textButton: textButton ?? 'Aceptar',
          body: body ?? Container(),
          onComfirm: onComfirm ?? () {},
        );
      },
    );
  }

  static Future<void> calendar(
    BuildContext context, {
    required Function(DateTime) changeDate,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogCalendar(
          changeDate: changeDate,
        );
      },
    );
  }
}
