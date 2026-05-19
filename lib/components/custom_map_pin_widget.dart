import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'custom_map_pin_model.dart';
export 'custom_map_pin_model.dart';

class CustomMapPinWidget extends StatefulWidget {
  const CustomMapPinWidget({
    super.key,
    required this.photoUserMap,
  });

  final LocalizationRecord? photoUserMap;

  @override
  State<CustomMapPinWidget> createState() => _CustomMapPinWidgetState();
}

class _CustomMapPinWidgetState extends State<CustomMapPinWidget> {
  late CustomMapPinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomMapPinModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.circle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(),
        child: Image.network(
          widget.photoUserMap!.photoUrl,
          width: 200.0,
          height: 200.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
