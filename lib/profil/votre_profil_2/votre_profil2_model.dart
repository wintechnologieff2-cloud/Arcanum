import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets/arcane_carte_mini/arcane_carte_mini_widget.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'votre_profil2_widget.dart' show VotreProfil2Widget;
import 'package:flutter/material.dart';

class VotreProfil2Model extends FlutterFlowModel<VotreProfil2Widget> {
  ///  Local state fields for this page.

  List<String> photosPage = [];
  void addToPhotosPage(String item) => photosPage.add(item);
  void removeFromPhotosPage(String item) => photosPage.remove(item);
  void removeAtIndexFromPhotosPage(int index) => photosPage.removeAt(index);
  void insertAtIndexInPhotosPage(int index, String item) =>
      photosPage.insert(index, item);
  void updatePhotosPageAtIndex(int index, Function(String) updateFn) =>
      photosPage[index] = updateFn(photosPage[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_profilPic = false;
  FFUploadedFile uploadedLocalFile_profilPic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilPic = '';

  // Model for arcaneCarteMini component.
  late ArcaneCarteMiniModel arcaneCarteMiniModel1;
  // Model for arcaneCarteMini component.
  late ArcaneCarteMiniModel arcaneCarteMiniModel2;
  // Model for arcaneCarteMini component.
  late ArcaneCarteMiniModel arcaneCarteMiniModel3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  bool isDataUploading_uploadedPics = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadedPics = [];
  List<String> uploadedFileUrls_uploadedPics = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for DDCommunication widget.
  String? dDCommunicationValue;
  FormFieldController<String>? dDCommunicationValueController;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    arcaneCarteMiniModel1 = createModel(context, () => ArcaneCarteMiniModel());
    arcaneCarteMiniModel2 = createModel(context, () => ArcaneCarteMiniModel());
    arcaneCarteMiniModel3 = createModel(context, () => ArcaneCarteMiniModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    arcaneCarteMiniModel1.dispose();
    arcaneCarteMiniModel2.dispose();
    arcaneCarteMiniModel3.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    navBarModel.dispose();
  }
}
