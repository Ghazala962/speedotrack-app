import '/components/gazala_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'details47_property_listing_model.dart';
export 'details47_property_listing_model.dart';

class Details47PropertyListingWidget extends StatefulWidget {
  const Details47PropertyListingWidget({super.key});

  static String routeName = 'Details47PropertyListing';
  static String routePath = '/details47PropertyListing';

  @override
  State<Details47PropertyListingWidget> createState() =>
      _Details47PropertyListingWidgetState();
}

class _Details47PropertyListingWidgetState
    extends State<Details47PropertyListingWidget> {
  late Details47PropertyListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Details47PropertyListingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/display-a-map-b4974c7cfef498eb43e99ab60191cbaf.png',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.gazalaModel,
                          updateCallback: () => safeSetState(() {}),
                          child: GazalaWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(SizedBox(height: 38.0)),
            ),
          ),
        ),
      ),
    );
  }
}
