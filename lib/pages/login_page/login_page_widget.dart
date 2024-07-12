import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popup/invalid_otp/invalid_otp_widget.dart';
import '/popup/wrong_num/wrong_num_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFieldOtpTextController ??= TextEditingController();
    _model.textFieldOtpFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: 450.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            constraints: const BoxConstraints(
              minWidth: 320.0,
              minHeight: 650.0,
              maxWidth: 450.0,
              maxHeight: 900.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFEEECF1),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.logincondition = 0;
                              setState(() {});
                            },
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: FlutterFlowTheme.of(context).accent,
                              size: 24.0,
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/leapmile.png',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ].divide(const SizedBox(width: 6.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Welcome to',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).heading,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.0,
                                ),
                          ),
                          Text(
                            'CV Raman Nagar',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).heading,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.0,
                                ),
                          ),
                        ]
                            .divide(const SizedBox(height: 10.0))
                            .addToStart(const SizedBox(height: 7.0)),
                      ),
                    ),
                  ),
                  if (_model.logincondition == 0)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 10.0, 10.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 15.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'new_item_scaner',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 170.0,
                                          height: 170.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/amico.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'Login',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Text(
                                            'Enter Mobile Number',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                          child: Container(
                                            width: 320.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .liteBg,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Icon(
                                                      Icons.dialpad_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .heading,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController1,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          if (functions
                                                              .checklength(_model
                                                                  .textController1
                                                                  .text)!) {
                                                            _model.apiResult9toCopy =
                                                                await InboundGroupGroup
                                                                    .genrateOtpCall
                                                                    .call(
                                                              userPhone: _model
                                                                  .textController1
                                                                  .text,
                                                            );

                                                            FFAppState()
                                                                    .phonenum =
                                                                _model
                                                                    .textController1
                                                                    .text;
                                                            FFAppState()
                                                                .update(() {});
                                                            _model.logincondition =
                                                                1;
                                                            setState(() {});
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const WrongNumWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }

                                                          setState(() {});
                                                        },
                                                        autofocus: true,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .none,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Mobile Number',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                        maxLength: 10,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textController1Validator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 20.0, 10.0, 0.0),
                                          child: Container(
                                            width: 300.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .heading,
                                                  FlutterFlowTheme.of(context)
                                                      .accent
                                                ],
                                                stops: const [0.0, 1.0],
                                                begin: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                end: const AlignmentDirectional(
                                                    -1.0, 0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (functions.checklength(_model
                                                    .textController1.text)!) {
                                                  _model.apiResult9to =
                                                      await InboundGroupGroup
                                                          .genrateOtpCall
                                                          .call(
                                                    userPhone: _model
                                                        .textController1.text,
                                                  );

                                                  _model.logincondition = 1;
                                                  setState(() {});
                                                  FFAppState().phonenum = _model
                                                      .textController1.text;
                                                  FFAppState().update(() {});
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: const WrongNumWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }

                                                setState(() {});
                                              },
                                              text: 'Send OTP',
                                              options: FFButtonOptions(
                                                width: 300.0,
                                                height: 45.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0x008E7CC3),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                          fontSize: 17.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_model.logincondition == 1)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 10.0, 10.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 15.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 170.0,
                                          height: 170.0,
                                          decoration: const BoxDecoration(),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/amico.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'Verify OTP',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              height: 30.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 330.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Mobile Number : ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    _model.textController1.text,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            'Enter the OTP, Sent to Mobile Number',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                          child: Container(
                                            width: 320.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .liteBg,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.password,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .heading,
                                                    size: 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  1.0,
                                                                  5.0,
                                                                  1.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldOtpTextController,
                                                        focusNode: _model
                                                            .textFieldOtpFocusNode,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          _model.apiResultub2c =
                                                              await InboundGroupGroup
                                                                  .validateOtpCall
                                                                  .call(
                                                            userPhone: _model
                                                                .textController1
                                                                .text,
                                                            otpText: _model
                                                                .textFieldOtpTextController
                                                                .text,
                                                          );

                                                          if ((_model
                                                                  .apiResultub2c
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.apiResultjpiC =
                                                                await InboundGroupGroup
                                                                    .customerDetailsCall
                                                                    .call(
                                                              userPhone: _model
                                                                  .textController1
                                                                  .text,
                                                            );

                                                            if ((_model
                                                                    .apiResultjpiC
                                                                    ?.succeeded ??
                                                                true)) {
                                                              FFAppState()
                                                                      .userid =
                                                                  InboundGroupGroup
                                                                      .customerDetailsCall
                                                                      .id(
                                                                (_model.apiResultjpiC
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              await authManager
                                                                  .signIn(
                                                                authenticationToken:
                                                                    InboundGroupGroup
                                                                        .validateOtpCall
                                                                        .accesstoken(
                                                                  (_model.apiResultub2c
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                tokenExpiration:
                                                                    functions
                                                                        .tokenexp(
                                                                            3600),
                                                                authUid: InboundGroupGroup
                                                                    .customerDetailsCall
                                                                    .id(
                                                                      (_model.apiResultjpiC
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                    ?.toString(),
                                                                userData:
                                                                    UserStruct(
                                                                  userid: InboundGroupGroup
                                                                      .customerDetailsCall
                                                                      .id(
                                                                    (_model.apiResultjpiC
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  acccesstoken:
                                                                      InboundGroupGroup
                                                                          .validateOtpCall
                                                                          .accesstoken(
                                                                    (_model.apiResultub2c
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  customerphonenumber:
                                                                      int.tryParse(_model
                                                                          .textController1
                                                                          .text),
                                                                  displayName:
                                                                      InboundGroupGroup
                                                                          .customerDetailsCall
                                                                          .name(
                                                                    (_model.apiResultjpiC
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                ),
                                                              );

                                                              context
                                                                  .goNamedAuth(
                                                                'new_item_scaner',
                                                                context.mounted,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            }
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const InvalidOtpWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }

                                                          setState(() {});
                                                        },
                                                        autofocus: true,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .none,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'OTP',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                        maxLength: 6,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textFieldOtpTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 15.0, 10.0, 0.0),
                                          child: Container(
                                            width: 300.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .heading,
                                                  FlutterFlowTheme.of(context)
                                                      .accent
                                                ],
                                                stops: const [0.0, 1.0],
                                                begin: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                end: const AlignmentDirectional(
                                                    -1.0, 0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.apiResultub2 =
                                                    await InboundGroupGroup
                                                        .validateOtpCall
                                                        .call(
                                                  userPhone: _model
                                                      .textController1.text,
                                                  otpText: _model
                                                      .textFieldOtpTextController
                                                      .text,
                                                );

                                                if ((_model.apiResultub2
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.apiResultjpi =
                                                      await InboundGroupGroup
                                                          .customerDetailsCall
                                                          .call(
                                                    userPhone: _model
                                                        .textController1.text,
                                                  );

                                                  if ((_model.apiResultjpi
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().userid =
                                                        InboundGroupGroup
                                                            .customerDetailsCall
                                                            .id(
                                                      (_model.apiResultjpi
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().update(() {});
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signIn(
                                                      authenticationToken:
                                                          InboundGroupGroup
                                                              .validateOtpCall
                                                              .accesstoken(
                                                        (_model.apiResultub2
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      tokenExpiration: functions
                                                          .tokenexp(3600),
                                                      authUid: InboundGroupGroup
                                                          .customerDetailsCall
                                                          .id(
                                                            (_model.apiResultjpi
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          ?.toString(),
                                                      userData: UserStruct(
                                                        userid: InboundGroupGroup
                                                            .customerDetailsCall
                                                            .id(
                                                          (_model.apiResultjpi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        acccesstoken:
                                                            InboundGroupGroup
                                                                .validateOtpCall
                                                                .accesstoken(
                                                          (_model.apiResultub2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        customerphonenumber:
                                                            int.tryParse(_model
                                                                .textController1
                                                                .text),
                                                        displayName:
                                                            InboundGroupGroup
                                                                .customerDetailsCall
                                                                .name(
                                                          (_model.apiResultjpi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      ),
                                                    );

                                                    context.goNamedAuth(
                                                      'new_item_scaner',
                                                      context.mounted,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const InvalidOtpWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }

                                                setState(() {});
                                              },
                                              text: 'Verify OTP',
                                              options: FFButtonOptions(
                                                width: 300.0,
                                                height: 45.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0x008E7CC3),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                          fontSize: 17.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Resend OTP',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subHeader,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowTimer(
                                                initialTime:
                                                    _model.timerInitialTimeMs,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  milliSecond: false,
                                                ),
                                                controller:
                                                    _model.timerController,
                                                updateStateInterval: const Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.timerMilliseconds =
                                                      value;
                                                  _model.timerValue =
                                                      displayTime;
                                                  if (shouldUpdate) {
                                                    setState(() {});
                                                  }
                                                },
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Contact',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Support',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color:
                                        FlutterFlowTheme.of(context).bodyText,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
