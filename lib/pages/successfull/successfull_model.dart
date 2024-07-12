import '/flutter_flow/flutter_flow_util.dart';
import 'successfull_widget.dart' show SuccessfullWidget;
import 'package:flutter/material.dart';

class SuccessfullModel extends FlutterFlowModel<SuccessfullWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
