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

import 'package:mobile_scanner/mobile_scanner.dart'; // Add this import
import 'package:provider/provider.dart'; // Add Provider for model management
import '/custom_code/actions/index.dart' as actions;
// Import the file where InboundGroupGroup is defined
import '../../backend/api_requests/api_calls.dart';

import 'index.dart'; // Imports other custom widgets
import '/pages/new_item_scaner/new_item_scaner_model.dart'; // Import the NewItemScanerModel

class Productbarcode extends StatefulWidget {
  const Productbarcode({
    super.key,
    this.width,
    this.height,
    this.userid,
    this.storeid,
  });

  final double? width;
  final double? height;
  final int? userid;
  final String? storeid;

  @override
  State<Productbarcode> createState() => _ProductbarcodeState();
}

class _ProductbarcodeState extends State<Productbarcode> {
  MobileScannerController controller = MobileScannerController();
  late NewItemScanerModel _model;
  bool _isProcessing = false;
  String? _lastScanValue; // Variable to store the last scanned value

  @override
  void initState() {
    super.initState();
    _model = NewItemScanerModel(); // Initialize the model
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
                if (scanValue != _lastScanValue) {
                  _lastScanValue = scanValue; // Update the last scan value
                  await _handleApiResponse(scanValue);
                } else {
                  // _showAlreadyAddedMessage();
                }
              }

              setState(() {
                _isProcessing = false;
              });
            },
          ),
          // Add any other UI elements you need
        ],
      ),
    );
  }

  Future<void> _handleApiResponse(String scanValue) async {
    final apiResult = await InboundGroupGroup.inboundOrderDetailsCall.call(
      itemBarcode: scanValue,
      userRecordId: widget.userid,
      robotId: widget.storeid, // Pass the storeid as the robotId
    );

    if (apiResult.succeeded) {
      setState(() {
        _model.apiRequestCompleter = null;
        _model.textController?.clear();
      });
    } else {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context, // Use the current BuildContext
        builder: (context) {
          return GestureDetector(
            onTap: () {
              if (_model.unfocusNode.canRequestFocus) {
                FocusScope.of(context).requestFocus(_model.unfocusNode);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            child: Padding(
              padding:
                  MediaQuery.of(context).viewInsets, // Use MediaQuery properly
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
      ).then((value) => setState(() {
            // Update your state here if needed
          }));
    }
    setState(() {});
  }

  void _showAlreadyAddedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product already added')),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// Placeholder for InvalidUserWidget
class InvalidUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Text('Invalid User'),
    );
  }
}
