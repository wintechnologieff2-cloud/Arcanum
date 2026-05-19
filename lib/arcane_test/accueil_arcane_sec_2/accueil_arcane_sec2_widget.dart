import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/carte_temperance_secondaire/carte_temperance_secondaire_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accueil_arcane_sec2_model.dart';
export 'accueil_arcane_sec2_model.dart';

class AccueilArcaneSec2Widget extends StatefulWidget {
  const AccueilArcaneSec2Widget({super.key});

  static String routeName = 'Accueil-arcane-sec-2';
  static String routePath = '/accueilArcaneSec2';

  @override
  State<AccueilArcaneSec2Widget> createState() =>
      _AccueilArcaneSec2WidgetState();
}

class _AccueilArcaneSec2WidgetState extends State<AccueilArcaneSec2Widget>
    with TickerProviderStateMixin {
  late AccueilArcaneSec2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccueilArcaneSec2Model());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'carteTemperanceSecondaireOnPageLoadAnimation1': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, 0.349),
          ),
        ],
      ),
      'carteTemperanceSecondaireOnPageLoadAnimation2': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, -0.314),
          ),
        ],
      ),
      'carteTemperanceSecondaireOnPageLoadAnimation3': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, 0.349),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: AlignmentDirectional(0.0, 0.0),
              image: Image.asset(
                'assets/images/ba733781644e66f8143994ae70c17c1218098ed6.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/arcanum-7wx74m/assets/1a99yswb8t7u/Lavender_tarot_card_logo_design-2.png',
                          width: 210.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ct1xdchv' /* Vos arcanes
secondaires sont..... */
                        ,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.spectral(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF676C78),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<ArcaneRecord>>(
                        stream: queryArcaneRecord(
                          queryBuilder: (arcaneRecord) => arcaneRecord.where(
                            'nom',
                            isEqualTo:
                                FFAppState().top4Arcane.elementAtOrNull(1),
                          ),
                          singleRecord: true,
                        ),
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
                          List<ArcaneRecord>
                              carteTemperanceSecondaireArcaneRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final carteTemperanceSecondaireArcaneRecord =
                              carteTemperanceSecondaireArcaneRecordList
                                      .isNotEmpty
                                  ? carteTemperanceSecondaireArcaneRecordList
                                      .first
                                  : null;

                          return wrapWithModel(
                            model: _model.carteTemperanceSecondaireModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: CarteTemperanceSecondaireWidget(
                              arcaneRef: carteTemperanceSecondaireArcaneRecord!
                                  .reference,
                            ),
                          ).animateOnPageLoad(animationsMap[
                              'carteTemperanceSecondaireOnPageLoadAnimation1']!);
                        },
                      ),
                      StreamBuilder<List<ArcaneRecord>>(
                        stream: queryArcaneRecord(
                          queryBuilder: (arcaneRecord) => arcaneRecord.where(
                            'nom',
                            isEqualTo:
                                FFAppState().top4Arcane.elementAtOrNull(2),
                          ),
                          singleRecord: true,
                        ),
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
                          List<ArcaneRecord>
                              carteTemperanceSecondaireArcaneRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final carteTemperanceSecondaireArcaneRecord =
                              carteTemperanceSecondaireArcaneRecordList
                                      .isNotEmpty
                                  ? carteTemperanceSecondaireArcaneRecordList
                                      .first
                                  : null;

                          return wrapWithModel(
                            model: _model.carteTemperanceSecondaireModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: CarteTemperanceSecondaireWidget(
                              arcaneRef: carteTemperanceSecondaireArcaneRecord!
                                  .reference,
                            ),
                          ).animateOnPageLoad(animationsMap[
                              'carteTemperanceSecondaireOnPageLoadAnimation2']!);
                        },
                      ),
                      StreamBuilder<List<ArcaneRecord>>(
                        stream: queryArcaneRecord(
                          queryBuilder: (arcaneRecord) => arcaneRecord.where(
                            'nom',
                            isEqualTo: FFAppState().top4Arcane.lastOrNull,
                          ),
                          singleRecord: true,
                        ),
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
                          List<ArcaneRecord>
                              carteTemperanceSecondaireArcaneRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final carteTemperanceSecondaireArcaneRecord =
                              carteTemperanceSecondaireArcaneRecordList
                                      .isNotEmpty
                                  ? carteTemperanceSecondaireArcaneRecordList
                                      .first
                                  : null;

                          return wrapWithModel(
                            model: _model.carteTemperanceSecondaireModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: CarteTemperanceSecondaireWidget(
                              arcaneRef: carteTemperanceSecondaireArcaneRecord!
                                  .reference,
                            ),
                          ).animateOnPageLoad(animationsMap[
                              'carteTemperanceSecondaireOnPageLoadAnimation3']!);
                        },
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 40.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(HomeWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      '11fsb37y' /* Terminer */,
                    ),
                    options: FFButtonOptions(
                      width: 335.0,
                      height: 33.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFE4BAFF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.spectral(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
