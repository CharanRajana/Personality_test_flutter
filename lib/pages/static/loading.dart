import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? id;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getId() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    setState(() {
      id = deviceId!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getId();
    return Scaffold(
      appBar: AppBar(
        //actions: [
        //  InkWell(
        //    onTap: () => getId(),
        //    child: const Padding(
        //      padding: EdgeInsets.all(12.0),
        //      child: Icon(
        //        Icons.get_app,
        //      ),
        //    ),
        //  ),
        //],
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                id ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Please wait...\n Connecting with the people',
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const CircularProgressIndicator(
              strokeWidth: 8,
            ),
          ],
        ),
      ),
    );
  }
}
