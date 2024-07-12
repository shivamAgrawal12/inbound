// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:just_audio/just_audio.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import '/custom_code/actions/index.dart' as actions;

class Qrmainscan extends StatefulWidget {
  const Qrmainscan({
    super.key,
    this.width,
    this.height,
    this.storename,
  });

  final double? width;
  final double? height;
  final List<String>? storename;

  @override
  State<Qrmainscan> createState() => _QrmainscanState();
}

class _QrmainscanState extends State<Qrmainscan> {
  MobileScannerController controller = MobileScannerController();
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  bool isProcessing = false; // Variable to prevent multiple scans at once

  @override
  void initState() {
    super.initState();
    // Start the scanner and set the initial zoom scale when the widget is first created
    controller.start().then((_) {
      controller.setZoomScale(0.7).catchError((error) {
        print('Error setting zoom scale: $error');
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.stop();
    }
    controller.start().then((_) {
      controller.setZoomScale(0.7).catchError((error) {
        print('Error setting zoom scale: $error');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (barcodeCapture) async {
              if (isProcessing) return;
              setState(() {
                isProcessing = true;
              });

              final String? code = barcodeCapture.barcodes.first.rawValue;

              if (widget.storename != null &&
                  widget.storename!.contains(code)) {
                FFAppState().robotqrcode = code!;
                await actions.continuousVibration(0, 0, 0, 500);
                FFAppState().wrongscanresult = '';
                FFAppState().update(() {});

                context.goNamed(
                  'new_item_scaner',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 500),
                    ),
                  },
                );
                await _playSound1();
              } else {
                await actions.continuousVibration(500, 1000, 500, 1000);
                await _playSound2();
                await _showWrongStoreDialog(context, code ?? 'Unknown code');
                FFAppState().wrongscanresult =
                    'Wrong store please scan Again !';
                HapticFeedback.vibrate();
              }

              Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  isProcessing = false;
                });
              });
            },
          ),
          Positioned(
            bottom: 12.0,
            left: 12.0,
            child: SizedBox(
              width: 35,
              height: 35,
              child: FloatingActionButton(
                onPressed: () async {
                  // Add your zoom out logic here
                  try {
                    double currentZoom = controller.zoomScaleState.value;
                    double newZoom = currentZoom - 0.1;
                    if (newZoom < 0.0) newZoom = 0.0;
                    await controller.setZoomScale(newZoom);
                  } catch (e) {
                    print('Error setting zoom scale: $e');
                  }
                },
                child: Icon(Icons.zoom_out),
                mini: true, // Make the button smaller
              ),
            ),
          ),
          Positioned(
            bottom: 12.0,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: SizedBox(
              width: 35,
              height: 35,
              child: FloatingActionButton(
                onPressed: () async {
                  try {
                    await controller.toggleTorch();
                  } catch (e) {
                    print('Error toggling torch: $e');
                  }
                },
                child: Icon(Icons.flash_on),
                mini: true, // Make the button smaller
              ),
            ),
          ),
          Positioned(
            bottom: 12.0,
            right: 12.0,
            child: SizedBox(
              width: 35,
              height: 35,
              child: FloatingActionButton(
                onPressed: () async {
                  // Add your zoom in logic here
                  try {
                    double currentZoom = controller.zoomScaleState.value;
                    double newZoom = currentZoom + 0.1;
                    if (newZoom > 1.0) newZoom = 1.0;
                    await controller.setZoomScale(newZoom);
                  } catch (e) {
                    print('Error setting zoom scale: $e');
                  }
                },
                child: Icon(Icons.zoom_in),
                mini: true, // Make the button smaller
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _playSound1() async {
    soundPlayer1 ??= AudioPlayer();
    if (soundPlayer1!.playing) {
      await soundPlayer1!.stop();
    }
    await soundPlayer1!.setAsset('assets/audios/click-124467.mp3');
    soundPlayer1!.setVolume(1);
    await soundPlayer1!.play();
  }

  Future<void> _playSound2() async {
    soundPlayer2 ??= AudioPlayer();
    if (soundPlayer2!.playing) {
      await soundPlayer2!.stop();
    }
    await soundPlayer2!.setAsset('assets/audios/vib.mp3');
    soundPlayer2!.setVolume(1);
    await soundPlayer2!.play();
  }

  Future<void> _showWrongStoreDialog(
      BuildContext context, String scannedValue) async {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Wrong store please scan again'),
          content: Text('Scanned Store Name: $scannedValue'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
