import 'package:flutter/material.dart';

class AudioModel with ChangeNotifier {
  
bool _playing=false;
Duration _songDuration=const Duration(milliseconds: 0);
Duration _current=const Duration(milliseconds: 0);


String get songTotalDuration => printDuration(_songDuration);
String get currentSeconds => printDuration(_current );



double get porcentaje => (_songDuration.inSeconds > 0)? _current.inSeconds/_songDuration.inSeconds:0;

late AnimationController _controller;
set controller(AnimationController val){
  _controller=val;
}

AnimationController get controller => _controller;

bool get playing => _playing;
set playing(bool val){
  _playing=val;
  notifyListeners();
}

Duration get songDuration => _songDuration;
set songDuration (Duration val){
_songDuration=val;
notifyListeners();
}
Duration get current => _current;
set current (Duration val){
_current=val;
notifyListeners();
}

String printDuration(Duration duration){
  String twoDigits(int n){
    if (n>=10) return "$n"; 
      
    return "0$n";
  }
  String twoDigitMinutes=twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds=twoDigits(duration.inSeconds.remainder(60));

  return "$twoDigitMinutes:$twoDigitSeconds";
}

}