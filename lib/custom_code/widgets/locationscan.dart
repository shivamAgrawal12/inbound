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
import '/custom_code/actions/index.dart' as actions;
import 'package:mobile_scanner/mobile_scanner.dart'; // Add this import
import 'package:provider/provider.dart'; // Add Provider for model management

// Import the file where InboundGroupGroup is defined
import '../../backend/api_requests/api_calls.dart';

import 'index.dart'; // Imports other custom widgets
import '/pages/each_item_detail/each_item_detail_model.dart'; // Import the NewItemScanerModel

class Locationscan extends StatefulWidget {
  const Locationscan({
    super.key,
    this.width,
    this.height,
    this.qyt,
    this.slotid,
    this.orderid,
  });

  final double? width;
  final double? height;
  final int? qyt;
  final String? slotid;
  final int? orderid;

  @override
  State<Locationscan> createState() => _LocationscanState();
}

class _LocationscanState extends State<Locationscan> {
  MobileScannerController controller = MobileScannerController();
  late EachItemDetailModel _model;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _model = EachItemDetailModel(); // Initialize the model
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
        children: <Widget>[
          MobileScanner(
            controller: controller,
            onDetect: (barcodeCapture) async {
              if (_isProcessing) return;
              setState(() {
                _isProcessing = true;
              });

              final String? scanValue = barcodeCapture.barcodes.first.rawValue;
              if (scanValue != null) {
                if (scanValue == widget.slotid) {
                  await _handleApiResponse(scanValue);
                } else {
                  _showSlotMismatchMessage(context, scanValue);
                }
              }

              setState(() {
                _isProcessing = false;
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

  Future<void> _handleApiResponse(String scanValue) async {
    final apiResult5u4 = await InboundGroupGroup.matchOrderSlotIdCall.call(
      orderId: widget.orderid ?? 0, // Replace with your logic to get order ID
      slotId: widget.slotid ?? '', // Replace with your logic to get slot ID
      itemQuantity:
          widget.qyt ?? 0, // Replace with your logic to get item quantity
    );

    if (apiResult5u4.succeeded ?? false) {
      setState(() => _model.apiRequestCompleter = null);

      final apiResultu831 = await InboundGroupGroup.inboundDataCall.call(
        orderStatus: 'order_placed',
      );

      if (apiResultu831.succeeded ?? false) {
        // Handle success case if needed
      }
    } else {
      _model.instantTimer?.cancel();
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Failed to post data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Dismiss the modal
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));
    }

    setState(() {});
  }

  void _showSlotMismatchMessage(BuildContext context, String scannedValue) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Scanned value does not match slot ID: $scannedValue')),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
