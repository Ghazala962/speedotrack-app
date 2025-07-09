import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'g_p_s_trackimg_screen_widget.dart' show GPSTrackimgScreenWidget;
import 'package:flutter/material.dart';

class GPSTrackimgScreenModel extends FlutterFlowModel<GPSTrackimgScreenWidget> {
  ///  Local state fields for this page.

  bool isLoadingGeneralInfo = true;

  dynamic liveVehicleTrackingData;

  bool showCard = true;

  String filterValue = 'all';

  ///  State fields for stateful widgets in this page.

  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    drawerComponentModel.dispose();
  }
}
