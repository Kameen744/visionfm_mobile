import 'package:assets_audio_player/assets_audio_player.dart';

class AudiosList {
  static final audios = <Audio>[
    Audio.liveStream(
      'https://stream.zeno.fm/9zke1mq8ed0uv',
      metas: Metas(
        id: 'gombe',
        title: 'Gombe',
        artist: 'Vision FM Gombe',
        album: '92.1',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://stream.zeno.fm/9zke1mq8ed0uv',
      metas: Metas(
        id: 'kaduna',
        title: 'Kaduna',
        artist: 'Vision FM Kaduna',
        album: '92.3',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://stream.zeno.fm/9zke1mq8ed0uv',
      metas: Metas(
        id: 'kano',
        title: 'Kano',
        artist: 'Vision FM Kano',
        album: '95.1',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
  ];
}
