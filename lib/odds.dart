import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class OddsPage extends StatefulWidget {
  @override
  _OddsPageState createState() => _OddsPageState();
}

class _OddsPageState extends State<OddsPage> {
  late Timer _timer;
  int _remainingTimeInSeconds = 7200;
  VideoPlayerController? _controller;
  bool _showLoading = true;
  bool _videoVisible = true;
  bool _isLoadingNextOdd = false; // Track loading state for the next odd button

  List<String> oddsList = [
    '2.74',
    '8.13',
    '2.25',
    '20.42',
    '2.57',
    '2.60',
    '14.80',
    '1.05'
  ];
  int currentOddIndex = 0;

  bool _isLoadingDelayed = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoadingDelayed = false;
      });
    });

    Future.delayed(Duration(seconds: 7), () {
      _controller = VideoPlayerController.asset('videos/crash.mp4')
        ..initialize().then((_) {
          setState(() {});
          _controller!.play().then((_) {
            setState(() {});
          });
        });
      setState(() {
        _showLoading = false;
      });
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTimeInSeconds > 0) {
        setState(() {
          _remainingTimeInSeconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller?.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _toggleVideoVisibility() {
    setState(() {
      _videoVisible = !_videoVisible;
    });
  }

  void _nextOdd() {
    // Simulate loading for 2 seconds
    setState(() {
      _isLoadingNextOdd = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentOddIndex = (currentOddIndex + 1) % oddsList.length;
        _isLoadingNextOdd = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odds Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _formatTime(_remainingTimeInSeconds),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFCBD0D1),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    _videoVisible
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 200,
                            child: _isLoadingDelayed
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : _showLoading
                                    ? Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : _controller?.value.isInitialized ?? false
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: VideoPlayer(_controller!),
                                            ),
                                          )
                                        : CircularProgressIndicator(),
                          )
                        : Container(),
                    Center(
                      child: TextButton(
                        onPressed: _toggleVideoVisibility,
                        child: Text(
                          _videoVisible
                              ? "Hide Crash's Live"
                              : "Show Crash's Live",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Center(
                      child: _isLoadingDelayed
                          ? CircularProgressIndicator()
                          : Text(
                              'Your odd is: ${oddsList[currentOddIndex]}',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                    ),
                    SizedBox(
                      height: 110.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 200.0,
                        height: 60.0,
                        child: ElevatedButton(
                          onPressed: _isLoadingNextOdd
                              ? null
                              : _nextOdd, // Disable button when loading
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: _isLoadingNextOdd
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Next Odd',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFCBD0D1), // Change the background color
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Powered by ChatGPT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OddsPage(),
  ));
}
