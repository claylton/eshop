import 'package:flutter/material.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/progress_indicator_widget.dart';

class LoaderWidget extends StatelessWidget {
  final dynamic object;
  final Function callback;

  const LoaderWidget({ super.key, required this.object, required this.callback });

   @override
   Widget build(BuildContext context) {
    if (object == null) {
      return const Center(
        child: ProgressIndicatorWidget(),
      );
    }
    if (object.length == 0) {
      return const Center(
        child: Text("Nenhum item encontrado"),
      );
    }
       return callback();
  }
}