import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swipe_essai_model.dart';
export 'swipe_essai_model.dart';

class SwipeEssaiWidget extends StatefulWidget {
  const SwipeEssaiWidget({super.key});

  @override
  State<SwipeEssaiWidget> createState() => _SwipeEssaiWidgetState();
}

class _SwipeEssaiWidgetState extends State<SwipeEssaiWidget> {
  late SwipeEssaiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeEssaiModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
