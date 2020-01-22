import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MaterialApp(
  home: MusicPlayer(),
));

class MusicPlayer extends StatefulWidget{
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}
class _MusicPlayerState extends State<MusicPlayer>{
  final audioName="musica.mp3";
  final musicName="Musica";

  AudioPlayer audioPlayer;
  AudioCache audioCache;

  double volumen=1;
  double Currentvolumen;

  Duration duration=Duration();
  Duration position=Duration();

  @override
  void initState(){
    super.initState();
    audioPlayer=AudioPlayer();
    audioCache=AudioCache(fixedPlayer: audioPlayer);
  }
  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player',style: TextStyle(
          fontSize: 20,
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(musicName,style: TextStyle(fontSize: 20),),
              Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: audioControls(),
                      ),
                    ),
                    /*Slider(
                      activeColor: Colors.purpleAccent,
                      value: position.inSeconds.toDouble(),
                      max: duration.inSeconds.toDouble(),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget CreateIconButton(IconData icon,Color color,VoidCallback onPressed){
    return IconButton(
      icon: Icon(icon),
      iconSize: 48,
      color: color,onPressed: onPressed,
    );
  }

  List<Widget> audioControls(){
    return <Widget>[
      CreateIconButton(Icons.play_arrow,Colors.green,(){
          audioCache.play(audioName);
      }),
      CreateIconButton(Icons.pause,Colors.blueGrey,(){
        audioPlayer.pause();
      }),
      CreateIconButton(Icons.stop,Colors.red,(){
        audioPlayer.stop();
      })
    ];
  }
}
