import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn_app/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class FloatingActionSpeechButton extends StatefulWidget {
  const FloatingActionSpeechButton({
    Key? key,
  }) : super(key: key);

  @override
  State<FloatingActionSpeechButton> createState() =>
      _FloatingActionSpeechButtonState();
}

class _FloatingActionSpeechButtonState
    extends State<FloatingActionSpeechButton> {
  stt.SpeechToText? _speech;
  bool _isListening = false;
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return AvatarGlow(
          animate: _isListening,
          endRadius: 80,
          glowColor: Colors.blue,
          child: FloatingActionButton(
            onPressed: (() async {
              if (!_isListening) {
                bool available = await _speech!.initialize(onError: (val) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(seconds: 5),
                    content: const Text("Please try again"),
                    action: SnackBarAction(
                      label: 'Got it',
                      onPressed: () {},
                    ),
                  ));
                });
                if (available) {
                  setState(() => _isListening = true);
                  _speech!.listen(onResult: (val) {
                    provider.retrieveData(val.recognizedWords);
                  });
                }
              } else {
                setState(() => _isListening = false);
                _speech!.stop();
              }
            }),
            child: const Icon(Icons.mic),
          ));
    });
  }
}
