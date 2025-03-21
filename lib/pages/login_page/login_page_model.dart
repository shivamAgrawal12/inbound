import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  int logincondition = 0;

  String? num;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (GenrateOtp)] action in TextField widget.
  ApiCallResponse? apiResult9toCopy;
  // Stores action output result for [Backend Call - API (GenrateOtp)] action in Button widget.
  ApiCallResponse? apiResult9to;
  // State field(s) for TextField_otp widget.
  FocusNode? textFieldOtpFocusNode;
  TextEditingController? textFieldOtpTextController;
  String? Function(BuildContext, String?)? textFieldOtpTextControllerValidator;
  // Stores action output result for [Backend Call - API (ValidateOtp)] action in TextField_otp widget.
  ApiCallResponse? apiResultub2c;
  // Stores action output result for [Backend Call - API (customer details)] action in TextField_otp widget.
  ApiCallResponse? apiResultjpiC;
  // Stores action output result for [Backend Call - API (ValidateOtp)] action in Button widget.
  ApiCallResponse? apiResultub2;
  // Stores action output result for [Backend Call - API (customer details)] action in Button widget.
  ApiCallResponse? apiResultjpi;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 30000;
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldOtpFocusNode?.dispose();
    textFieldOtpTextController?.dispose();

    timerController.dispose();
  }
}
