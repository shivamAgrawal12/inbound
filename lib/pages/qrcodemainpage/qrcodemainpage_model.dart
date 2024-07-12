import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qrcodemainpage_widget.dart' show QrcodemainpageWidget;
import 'package:flutter/material.dart';

class QrcodemainpageModel extends FlutterFlowModel<QrcodemainpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (robot datails)] action in qrcodemainpage widget.
  ApiCallResponse? apiResult92w;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
