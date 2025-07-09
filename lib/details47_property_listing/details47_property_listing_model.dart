import '/components/gazala_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'details47_property_listing_widget.dart'
    show Details47PropertyListingWidget;
import 'package:flutter/material.dart';

class Details47PropertyListingModel
    extends FlutterFlowModel<Details47PropertyListingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for gazala component.
  late GazalaModel gazalaModel;

  @override
  void initState(BuildContext context) {
    gazalaModel = createModel(context, () => GazalaModel());
  }

  @override
  void dispose() {
    gazalaModel.dispose();
  }
}
