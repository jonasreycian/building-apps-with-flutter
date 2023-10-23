import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as alert;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'alert_dialog_model.dart';

class AlertDialog extends StackedView<AlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AlertDialogModel viewModel,
    Widget? child,
  ) {
    return alert.AlertDialog(
      title: Text(request.title ?? "Error!"),
      content: Text(request.description ?? "Something went wrong"),
    );
  }

  @override
  AlertDialogModel viewModelBuilder(BuildContext context) => AlertDialogModel();
}
