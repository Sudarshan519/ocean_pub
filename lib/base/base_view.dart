import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewmodel, Widget child)
      builder;
  final T viewModel;
  final Widget child;
  final Function(T) onModelReady;

  BaseWidget({
    Key key,
    this.builder,
    this.viewModel,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T viewmodel;

  @override
  void initState() {
    viewmodel = widget.viewModel;

    if (widget.onModelReady != null) {
      widget.onModelReady(viewmodel);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewmodel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
