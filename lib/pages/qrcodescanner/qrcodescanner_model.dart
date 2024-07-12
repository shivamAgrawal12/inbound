import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qrcodescanner_widget.dart' show QrcodescannerWidget;
import 'package:flutter/material.dart';

class QrcodescannerModel extends FlutterFlowModel<QrcodescannerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (robot datails)] action in qrcodescanner widget.
  ApiCallResponse? apiResult92w3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
