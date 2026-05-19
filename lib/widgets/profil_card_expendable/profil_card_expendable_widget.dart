import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/arcaniste_widget_grand/arcaniste_widget_grand_widget.dart';
import '/widgets/small_profil_card/small_profil_card_widget.dart';
import 'package:flutter/material.dart';
import 'profil_card_expendable_model.dart';
export 'profil_card_expendable_model.dart';

class ProfilCardExpendableWidget extends StatefulWidget {
  const ProfilCardExpendableWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<ProfilCardExpendableWidget> createState() =>
      _ProfilCardExpendableWidgetState();
}

class _ProfilCardExpendableWidgetState
    extends State<ProfilCardExpendableWidget> {
  late ProfilCardExpendableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilCardExpendableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_model.isWidgetExpanded == true)
          wrapWithModel(
            model: _model.arcanisteWidgetGrandModel,
            updateCallback: () => safeSetState(() {}),
            child: ArcanisteWidgetGrandWidget(
              userRef: widget.userRef!,
            ),
          ),
        if (_model.isWidgetExpanded == false)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.isWidgetExpanded = true;
              safeSetState(() {});
            },
            child: wrapWithModel(
              model: _model.smallProfilCardModel,
              updateCallback: () => safeSetState(() {}),
              child: SmallProfilCardWidget(
                userRef: widget.userRef!,
              ),
            ),
          ),
      ],
    );
  }
}
