import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'carte_temperance_secondaire_model.dart';
export 'carte_temperance_secondaire_model.dart';

class CarteTemperanceSecondaireWidget extends StatefulWidget {
  const CarteTemperanceSecondaireWidget({
    super.key,
    required this.arcaneRef,
  });

  final DocumentReference? arcaneRef;

  @override
  State<CarteTemperanceSecondaireWidget> createState() =>
      _CarteTemperanceSecondaireWidgetState();
}

class _CarteTemperanceSecondaireWidgetState
    extends State<CarteTemperanceSecondaireWidget> {
  late CarteTemperanceSecondaireModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarteTemperanceSecondaireModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArcaneRecord>(
      stream: ArcaneRecord.getDocument(widget.arcaneRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerArcaneRecord = snapshot.data!;

        return Container(
          width: 335.0,
          height: 160.0,
          decoration: BoxDecoration(
            color: Color(0xFFFAF2E9),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Color(0xFFCCCCCC),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              FFLocalizations.of(context).languageCode == 'fr'
                                  ? containerArcaneRecord.nom
                                  : containerArcaneRecord.nomEn,
                              'Nom',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.spectral(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF676C78),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              FFLocalizations.of(context).languageCode == 'fr'
                                  ? containerArcaneRecord.qualites
                                  : containerArcaneRecord.qualitesEn,
                              'Nom',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.spectral(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF7E8491),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            '${formatNumber(
                              functions.calculateSecondPercantage(
                                  (currentUserDocument?.arcaneList.toList() ??
                                          [])
                                      .toList(),
                                  containerArcaneRecord.nom),
                              formatType: FormatType.custom,
                              format: '0',
                              locale: '',
                            )}%',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.spectral(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF7E8491),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      containerArcaneRecord.image,
                      width: 106.0,
                      height: 130.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
        );
      },
    );
  }
}
