import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/freemium/freemium_widget.dart';
import 'package:flutter/material.dart';
import 'limitedematch_model.dart';
export 'limitedematch_model.dart';

class LimitedematchWidget extends StatefulWidget {
  const LimitedematchWidget({super.key});

  static String routeName = 'Limitedematch';
  static String routePath = '/limitedematch';

  @override
  State<LimitedematchWidget> createState() => _LimitedematchWidgetState();
}

class _LimitedematchWidgetState extends State<LimitedematchWidget> {
  late LimitedematchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitedematchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: wrapWithModel(
              model: _model.freemiumModel,
              updateCallback: () => safeSetState(() {}),
              child: FreemiumWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
