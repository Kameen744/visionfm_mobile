class NewsClass {
  // {
  // "id": 82,
  // "title": "An Tsige Donald Trump A Karo Na Biyu",
  // "titlehundred": "An Tsige Donald Trump A Karo Na Biyu",
  // "titlesixty": "An Tsige Donald Trump A Karo Na Biyu",
  // "titlefifty": "An Tsige Donald Trump A Karo Na Biyu",
  // "slug": "an-tsige-donald-trump-a-karo-na-biyu",
  // "detailshome": "Majalisar Wakilan Amurka ta tsige Shugaba Donald Trump saboda laifin \"tunzura mutane su hambarar da gwamnati\" da wasu mabiyansa suka yi a ginin majalisar kasar a makon jiya.Shi ne shugaban kasar na farko a tarihin Amurka da aka taba tsige wa daga mukamin shugaban ƙasa har sau biyu - wanda kuma majal ...",
  // "detailsread": "<p></p><p><b>Majalisar Wakilan Amurka ta tsige Shugaba Donald Trump saboda laifin \"tunzura mutane su hambarar da gwamnati\" da wasu mabiyansa suka yi a ginin majalisar kasar a makon jiya.</b></p><p>Shi ne shugaban kasar na farko a tarihin Amurka da aka taba tsige wa daga mukamin shugaban ƙasa har sau biyu - wanda kuma majalisar za ta yi wa shari'a a karo na biyu.</p><p>Mista Trump dan jam'iyyar Republican zai fuskanci wata shari'a a majalisar dattawan ƙasar, wanda idan ta same shi da laifi zai iya rasa damar sake neman ko wane mukami na tsawon rayuwarsa.</p><p>Yawancin 'yan majalisar wakilan sun bi sahun jam'iyyarsu ne wajen kada ƙuri'ar tsige shugaba, inda aka tsige shi da ƙuri'u 232, su kuma waɗanda su ka ki goyon bayan a tsige shi aka sami ƙuri'u 197.</p><p>Ranar 20 ga watan Janairun nan Mista Trump zai bar ofis bayan da ya sha kaye a hannun Joe Biden a zaben watan Nuwamba.</p><p>An dai shafe sa'o'i ana tafka muhawara kafin 'yan majalisar su ka ƙada kuri'ar tsige shugaban.</p><p>'Yan majalisa 10 daga jam'iyyar Republican mai mulkin kasar sun goyi bayan takwarorinsu na Democrat wajen kaɗa ƙuri'ar tsige Mista Trump.</p><p>Sai dai da wuya a dauki mataki kan Mista Trump gabanin saukarsa daga mulki nan da mako guda saboda Majalisar Dattawa na hutu kuma ba a sa ran za ta dawo domin duba batun.</p><p>A makon jiya 'yan majalisa daga jam'iyyar Republican su 139 su ka kaɗa kuri'ar amincewa da sakamakon zaben shugaban ƙasa na 2020 da kuma shan kayen da Mista Trump ya yi.</p><p></p>",
  // "catname": "News",
  // "imgalt": "An Tsige D...",
  // "url": "http://visionfm.ng/api/v1/posts",
  // "image": "http://visionfm.ng/images/news/news-1610613937600004b143237.jpg",
  // "imagemd": "http://visionfm.ng/images/news/md-news-1610613937600004b143237.jpg",
  // "imagesm": "http://visionfm.ng/images/news/sm-news-1610613937600004b143237.jpg",
  // "time": "14/01/2021 - 08:45 AM",
  // "author": null
  // }
  final int id;
  final String title;
  final String slug;
  final String detailshome;
  final String detailsread;
  final String catname;
  final String image;
  final String imagemd;
  final String imagesm;
  final String time;
  final String url;

  NewsClass.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        title = jsonMap['title'] ?? '',
        slug = jsonMap['slug'] ?? '',
        detailshome = jsonMap['detailshome'] ?? '',
        detailsread = jsonMap['detailsread'] ?? '',
        catname = jsonMap['catname'] ?? '',
        image = jsonMap['image'] ?? '',
        imagemd = jsonMap['imagemd'] ?? '',
        imagesm = jsonMap['imagesm'] ?? '',
        time = jsonMap['time'] ?? '',
        url = 'https://visionfm.ng/page/news/${jsonMap['slug']}' ?? '';
}
