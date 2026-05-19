import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import '/widgets/profil_card_expendable/profil_card_expendable_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'explore02_copy_model.dart';
export 'explore02_copy_model.dart';

class Explore02CopyWidget extends StatefulWidget {
  const Explore02CopyWidget({super.key});

  static String routeName = 'Explore_02Copy';
  static String routePath = '/explore02Copy';

  @override
  State<Explore02CopyWidget> createState() => _Explore02CopyWidgetState();
}

class _Explore02CopyWidgetState extends State<Explore02CopyWidget> {
  late Explore02CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Explore02CopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

      await LocalizationRecord.collection
          .doc(currentUserUid)
          .set(createLocalizationRecordData(
            userId: currentUserUid,
            updatedAt: getCurrentTimestamp,
            location: currentUserLocationValue,
            userRef: currentUserReference,
            photoPath:
                valueOrDefault(currentUserDocument?.photoPathArcanum, ''),
          ));
      await requestPermission(locationPermission);
      if (await getPermissionStatus(locationPermission)) {
        _model.instantTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 10000),
          callback: (timer) async {
            currentUserLocationValue =
                await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

            await LocalizationRecord.collection
                .doc(currentUserUid)
                .set(createLocalizationRecordData(
                  userId: currentUserUid,
                  updatedAt: getCurrentTimestamp,
                  location: currentUserLocationValue,
                  userRef: currentUserReference,
                  photoUrl: currentUserPhoto,
                  photoPath:
                      valueOrDefault(currentUserDocument?.photoPathArcanum, ''),
                ));
          },
          startImmediately: true,
        );
      }
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
    return StreamBuilder<List<LocalizationRecord>>(
      stream: queryLocalizationRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).contenair,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<LocalizationRecord> explore02CopyLocalizationRecordList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).contenair,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/ba733781644e66f8143994ae70c17c1218098ed6.png',
                ).image,
              ),
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).secondary
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
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
                    Text(
                      FFLocalizations.of(context).getText(
                        'osier7zs' /* Trouvez des arcanistes */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.spectral(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
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
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.58),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFAF2E9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                              ),
                              border: Border.all(
                                color: Color(0xFFCCCCCC),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 10.0, 8.0, 0.0),
                                    child: Container(
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        child: custom_widgets.LocalizationMap(
                                          width: double.infinity,
                                          height: 300.0,
                                          markerSize: 50.0,
                                          initialZoom: 25.0,
                                          showMyLocation: true,
                                          locationList:
                                              explore02CopyLocalizationRecordList
                                                  .map((e) => e.location)
                                                  .withoutNulls
                                                  .toList(),
                                          photoUrlList:
                                              explore02CopyLocalizationRecordList
                                                  .map((e) => e.photoPath)
                                                  .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.5, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '87g1bq0x' /* Arcaniste à proximité */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .spectral(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF7E8491),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord.where(
                                                      'isCompleted',
                                                      isEqualTo: true,
                                                    ),
                                                    limit: 10,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        columnUsersRecordList =
                                                        snapshot.data!
                                                            .where((u) =>
                                                                u.uid !=
                                                                currentUserUid)
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            columnUsersRecordList
                                                                .length,
                                                            (columnIndex) {
                                                          final columnUsersRecord =
                                                              columnUsersRecordList[
                                                                  columnIndex];
                                                          return ProfilCardExpendableWidget(
                                                            key: Key(
                                                                'Key4m2_${columnIndex}_of_${columnUsersRecordList.length}'),
                                                            userRef:
                                                                columnUsersRecord
                                                                    .reference,
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        12.0,
                        0.0,
                        12.0,
                        valueOrDefault<double>(
                          isAndroid ? 50.0 : 20.0,
                          0.0,
                        )),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
