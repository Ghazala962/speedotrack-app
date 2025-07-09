import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'notification_list_model.dart';
export 'notification_list_model.dart';

class NotificationListWidget extends StatefulWidget {
  const NotificationListWidget({
    super.key,
    required this.refresh,
  });

  final Future Function()? refresh;

  @override
  State<NotificationListWidget> createState() => _NotificationListWidgetState();
}

class _NotificationListWidgetState extends State<NotificationListWidget> {
  late NotificationListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
