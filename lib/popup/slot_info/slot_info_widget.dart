import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'slot_info_model.dart';
export 'slot_info_model.dart';

class SlotInfoWidget extends StatefulWidget {
  const SlotInfoWidget({super.key});

  @override
  State<SlotInfoWidget> createState() => _SlotInfoWidgetState();
}

class _SlotInfoWidgetState extends State<SlotInfoWidget> {
  late SlotInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SlotInfoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -0.6),
      child: Container(
        width: 300.0,
        height: 90.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Item slot ID matched.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            FlutterFlowTimer(
              initialTime: _model.timerInitialTimeMs,
              getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                milliSecond: false,
              ),
              controller: _model.timerController,
              updateStateInterval: const Duration(milliseconds: 1000),
              onChanged: (value, displayTime, shouldUpdate) {
                _model.timerMilliseconds = value;
                _model.timerValue = displayTime;
                if (shouldUpdate) setState(() {});
              },
              onEnded: () async {
                context.pushNamed(
                  'each_item_detail',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 1.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
