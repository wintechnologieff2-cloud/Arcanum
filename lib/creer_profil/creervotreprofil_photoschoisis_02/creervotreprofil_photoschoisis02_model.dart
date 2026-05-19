import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creervotreprofil_photoschoisis02_widget.dart'
    show CreervotreprofilPhotoschoisis02Widget;
import 'package:flutter/material.dart';

class CreervotreprofilPhotoschoisis02Model
    extends FlutterFlowModel<CreervotreprofilPhotoschoisis02Widget> {
  ///  Local state fields for this page.

  List<String> photos = [];
  void addToPhotos(String item) => photos.add(item);
  void removeFromPhotos(String item) => photos.remove(item);
  void removeAtIndexFromPhotos(int index) => photos.removeAt(index);
  void insertAtIndexInPhotos(int index, String item) =>
      photos.insert(index, item);
  void updatePhotosAtIndex(int index, Function(String) updateFn) =>
      photos[index] = updateFn(photos[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataRkj = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataRkj = [];
  List<String> uploadedFileUrls_uploadDataRkj = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
