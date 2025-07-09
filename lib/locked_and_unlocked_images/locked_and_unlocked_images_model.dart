import '/flutter_flow/flutter_flow_util.dart';
import 'locked_and_unlocked_images_widget.dart'
    show LockedAndUnlockedImagesWidget;
import 'package:flutter/material.dart';

class LockedAndUnlockedImagesModel
    extends FlutterFlowModel<LockedAndUnlockedImagesWidget> {
  ///  Local state fields for this page.

  String? searchVal;

  int? pageNo;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
