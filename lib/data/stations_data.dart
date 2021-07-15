import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:visionfm/models/station_model.dart';

class Stations {
  static final streamLinks = <Audio>[
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/abuja',
      metas: Metas(
        id: '1',
        title: 'Vision FM',
        artist: 'Abuja 92.1',
        album: '92.1',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/gombe',
      metas: Metas(
        id: '2',
        title: 'Vision FM',
        artist: 'Gombe 92.7',
        album: '92.7',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/kaduna',
      metas: Metas(
        id: '3',
        title: 'Vision FM',
        artist: 'Kaduna 92.5',
        album: '92.5',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/kano',
      metas: Metas(
        id: '4',
        title: 'Vision FM',
        artist: 'kano 92.5',
        album: '92.5',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/katsina',
      metas: Metas(
        id: '5',
        title: 'Vision FM',
        artist: 'Katsina 92.5',
        album: '92.5',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/kebbi',
      metas: Metas(
        id: '6',
        title: 'Vision FM',
        artist: 'Kebbi 92.9',
        album: '92.9',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
    Audio.liveStream(
      'https://uk7.internet-radio.com/proxy/kameen?mp=/sokoto',
      metas: Metas(
        id: '7',
        title: 'Vision FM',
        artist: 'Sokoto 92.5',
        album: '92.5',
        image: MetasImage.asset('images/logo.png'),
      ),
    ),
  ];

  static List<Station> list = [
    Station(
      id: 1,
      frequency: '92.1',
      location: 'Abuja',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/abuja',
      playing: false,
    ),
    Station(
      id: 2,
      frequency: '92.7',
      location: 'Gombe',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/gombe',
      playing: false,
    ),
    Station(
      id: 3,
      frequency: '92.5',
      location: 'Kaduna',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/kaduna',
      playing: false,
    ),
    Station(
      id: 4,
      frequency: '92.5',
      location: 'Kano',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/kano',
      playing: false,
    ),
    Station(
      id: 5,
      frequency: '92.1',
      location: 'Katsina',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/katsina',
      playing: false,
    ),
    Station(
      id: 6,
      frequency: '92.9',
      location: 'Kebbi',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/kebbi',
      playing: false,
    ),
    Station(
      id: 7,
      frequency: '92.5',
      location: 'Sokoto',
      streamUrl: 'https://uk7.internet-radio.com/proxy/kameen?mp=/sokoto',
      playing: false,
    ),
  ];
}
