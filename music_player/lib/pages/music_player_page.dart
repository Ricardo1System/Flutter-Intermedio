import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/models/audio_model.dart';
import 'package:music_player/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';


class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Column(
            children: [
              CustomAppBar(),
               _ImagenDiscoDuracion(),
               _TituloPlay(),
              const Lyrics()
            ],
          ),
        ],
      )
   );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height*0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
          Color(0xFF33333E),
          Color(0xFF201E28),
        ])
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lyrics=getLyrics();
    return Expanded(
      child: ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyrics.map(
          (linea)=> Text(linea,style: TextStyle(fontSize: 20,color: Colors.white.withOpacity(0.6)),)
        ).toList(),
      ));
  }
}

class _TituloPlay extends StatefulWidget {
  

  @override
  State<_TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<_TituloPlay> with SingleTickerProviderStateMixin {
  bool playing=false;
  bool firstime=true;
  late AnimationController playAnimation;


  final assetAudioPlayer= AssetsAudioPlayer.newPlayer();

  @override
  void initState() {
    playAnimation=AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void open(){
    final audioPlayerModel=Provider.of<AudioModel>(context,listen: false);
    assetAudioPlayer.open(
      Audio('assets/Breaking-Benjamin-Far-Away.mp3'),
      autoStart: true,
      showNotification: true
      
      );

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current=duration;
     });

     assetAudioPlayer.current.listen((playinAudio) {
      if (playinAudio!=null) {
        
        audioPlayerModel.songDuration= playinAudio.audio.duration;
      }else{
        audioPlayerModel.songDuration= Duration(seconds: 0);
      }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text('Far Away', style: TextStyle(fontSize: 30,color: Colors.white.withOpacity(0.8)),),
              Text('-Breaking Benjamin-', style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.5)),),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: const Color(0xFFF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation ,
            ),
            // child: const Icon(Icons.play_arrow),
            onPressed: () {
              final audioPlayerModel=Provider.of<AudioModel>(context,listen: false);
              if (playing) {
                // playAnimation.stop();
                playing=false;
                audioPlayerModel.controller.stop();
              }else{
                // playAnimation.forward();
                playing=true;
                audioPlayerModel.controller.forward();
              }
              if (firstime) {
                open();
                firstime=false;
              }else{
                assetAudioPlayer.playOrPause();
              }
            }, )
        ],
      ),
    );
  }
}

class _ImagenDiscoDuracion extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 100),
      child:  Row(
        children: [
          _ImagenDisco(),
          const SizedBox(width: 20,),
          _BarraProgreso(),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel=Provider.of<AudioModel>(context,listen: false);
    final porcentaje=audioPlayerModel.porcentaje;
    return Column(
      children: [
        Text(audioPlayerModel.songTotalDuration, style: TextStyle(color: Colors.white.withOpacity(0.4)),),
        const SizedBox(height: 10,),
        Stack(
          children: [
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230*porcentaje,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Text(audioPlayerModel.currentSeconds, style: TextStyle(color: Colors.white.withOpacity(0.4)),),

      ],
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel=Provider.of<AudioModel>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
          Color(0xFF484750),
          Color(0xFF1E1C24),
        ])
      ),
      child: ClipRRect(borderRadius: BorderRadiusDirectional.circular(200),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SpinPerfect(
            duration: const Duration(seconds: 10),
            infinite: true,
            manualTrigger: true,
            controller: (animationController)=> audioPlayerModel.controller=animationController ,
            child: const Image(image: AssetImage('assets/aurora.jpg')
            )
            ),

          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
          
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C25),
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        ],
      )
      ),
    );
  }
}