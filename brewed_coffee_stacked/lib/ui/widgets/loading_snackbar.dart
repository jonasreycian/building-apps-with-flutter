import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'loading_snackbar.model.dart';

class LoadingSnackbar extends StackedView<LoadingSnackbarModel> {
  const LoadingSnackbar({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoadingSnackbarModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  LoadingSnackbarModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoadingSnackbarModel();
}
