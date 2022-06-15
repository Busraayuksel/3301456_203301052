import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yemek_tarifleri/api/api_source.dart';
import 'package:http/http.dart' as http;

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  late Future<FoodNames> names;

  Future<FoodNames> fetchNames() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Busraayuksel/json/main/names.json'));
    if (response.statusCode == 200) {
      return FoodNames.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    names = fetchNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> aciklma = [
      'Makarnayı haşlamak için uygun bir tencereye yeterli miktarda su alarak kaynatalım. '
          'Su kaynadıktan sonra tuz ve sıvı yağ ekleyerek spagettileri suyun içine alalım.'
          ' Dilerseniz bu tarifi farklı malzemeler kullanarak da hazırlayabilirsiniz Spagettiler istediğimiz kıvamda piştikten sonra suyunu süzelim.'
          ' Spagettinin kalınlığına göre önerilen pişme süresi paket üzerinde yer alıyor. '
          'Benim kullandığım makarnanın üzerinde pişirme süresi 9 dakika olarak yazıyordu siz kendi makarnanıza göre pişirebilirsiniz.'
          ' Tabi ki yine de kontrol ederek sevdiğiniz kıvama geldiğinde ocaktan alabilirsiniz.'
          ' Spagettileri süzgece aktardıktan sonra boşalan tencereye sıvı yağ biber – domates salçası ve naneyi alalım birkaç dakika kavuralım.'
          ' Dilerseniz haşlama suyundan 1 kepçe kadar ayırarak hazırladığınız bu sosa ilave edebilirsiniz Ardından spagettileri tencereye ilave ederek karıştıralım.'
          ' ve servis edelim.'
          ' Afiyet olsun!!!',
      'Öncelikle soğanları ince ince doğrayalım.'
          'Ardından mantarları minik minik doğrayalım. Bu aşamada dilerseniz mantarlarınızı yıkayabilir, dilerseniz de silebilirsiniz.'
          'Tencereye sıvı yağ ve tereyağını alarak erimesi için bekleyelim.'
          'Eridikten sonra soğanları ekleyelim ve hafif pembeleşene kadar kavuralım.'
          'Mantarları da ekleyelim ve orta ateşte mantarlar suyunu salıp çekinceye kadar kavuralım.'
          'Daha sonra unu ilave edelim ve unun kokusu çıkana kadar kavuralım.'
          'Bir taraftan karıştırırken bir taraftan da suyumuzu ekleyelim ve orta ateşte çorbamızı kaynamaya bırakalım.'
          'Çorbamız kaynadıktan sonra altını kısalım ve oda ısısındaki sütü ve karabiberi ilave ederek karıştıralım ve kaynamaya bırakalım.'
          'Son kez tuzumuzu da ekleyelim ve karıştırarak çorbamızı ocaktan alalım.'
          'Çorbamızın sosu için tavaya tereyağını alalım ve eritelim.'
          'Eriyen tereyağına kırmızı toz biberi ekleyerek kızdıralım ve ocaktan alalım.'
          'Çorbamızı kaselere koyduktan sonra üzerine sosumuzdan gezdirelim. Dilerseniz sosu tencereye aktarabilir ve karıştırarak servis edebilirsiniz. Afiyet olsun!',
      'Bir kasenin içerisine unu alıp ortasına yumurtayı kıralım, tuzu ekleyelim ve suyu yavaş yavaş döküp yoğurarak sert bir hamur elde edelim. '
          '2 beze yapıp nemli bir bez örtelim ve yarım saat dinlendirelim. '
          'Bu arada iç harcını hazırlayalım. '
          'Soğanı rendeleyip suyunu sıkalım. Kıymayı, rendelenmiş soğanı, maydanozu, naneyi ve baharatları bir kabın içine alıp iyice yoğuralım. '
          'Tezgahı hafif unlayarak oklava yardımı ile hamuru ne çok ince ne çok kalın olacak şekilde açalım (fazla unlamayın yoksa mantıları kapatırken birbirine yapışmaz). '
          'Keskin bir bıçakla uzunlamasına 2 cm büyüklükte keselim. Tekrar enine doğru 2 ye 2 cm olacak şekilde kesip kare hamurlar elde edelim. '
          'Parmak ucuyla kıymalı harçtan ortalarına yerleştirelim ve iki ucundan tutup kıstıralım. '
          'Bu şekilde 2 bezemizi bitirdikten sonra hafif unlu bir tepsiye mantıları döküp sallayalım ki birbirlerine yapışmasınlar. '
          'Pişirmek için tencereye su koyalım ve kaynamaya başlayınca tuz ve sıvı yağı koyup mantıları ilave edelim. 10-15 dk pişirdikten sonra ocaktan alıp üzerine soğuk su ilave edelim ve 1-2 dk sonra süzelim. '
          'Sosunu hazırlamak için tereyağını tavada eritip üzerine kırmızı biberi dökelim ve yağı yakmadan kızdıralım. '
          'Mantılar soğuduktan sonra sarımsaklı yoğurtla karıştırıp servis tabağına alalım ve tereyağlı sosu üzerine gezdirelim. Afiyet olsun :)',
      'Pirinç haşlanır ve süzülür.'
          'Soğan yemeklik olarak doğranır ve tavaya çok az miktarda sıvı yağ konarak öldürülür.'
          'Üzerine kıymanın yarısı ilave edilerek orta derecede kavrulur.'
          'Yağı tamamen süzülerek bir yayvan kaba aktarılır.'
          'İçine yumurta pirinç tuz biberi ayarlanıp çiğ olarak kalan 250 g kıyma da konulduktan sonra yoğurulur.'
          'Önemli olan malzemenin birbiriyle iyice özdeşmesidir. Köfte harcını en az yarım saat kadar dinlendirdikten sonra hazırlanan harçtan irice ve yassı oval şekilli hazırlanan köfteler önce una bulanır.'
          'Daha sonra bir kase içerisine kırıp çırptığınız yumurtaya batırılır.'
          'Tavada iyice kızdırılan sıvı yağda köftelerin her iki yönü kızartılır.'
          'Kızaran köfteleri kağıt havlu üzerine alarak fazla yağı alın.'
          'Servise hazır. Afiyet olsun…',
      'Havuç ve patates minik küp şeklinde doğranır ve tencereye alalım, üzerini geçecek kadar su ekleyerek 10 dakika kadar haşlanmaya bırakalım. Burada sebzelerin tam pişmemesi önemli, hafif diri kalması gerekiyor.'
          'Sebzelerimiz piştiktn sonra uyunu süzelim ve bir kenarda bekletelim.'
          'Ayrı bir tencereye bezelyelerimizi alalım üzerine su ekleyerek yumuşayıncaya kadar haşlayalım. Dilerseniz konserve bezelye de kullanabilirsiniz. '
          'Haşlanan bezelyelerimizin de suyunu süzelim ve bir kenarda bekletelim.'
          'Soğanı yemeklik doğrayarak yarım çay bardağı zeytinyağında hafif pembeleşene kadar kavuralım.'
          'Üzerine patates ve havucu ekleyelim. Haşladığımız bezelyeyi de ilave ederek 1-2 dakika karıştıralım ve ocaktan alalım.'
          'Enginarlarımızı uygun bir kap içerisine alalım yarım limon suyu ile ovalım ve tencereye dizelim.'
          'Orta kısımlarına hazırladığımız sebzelerden paylaştıralım. Kalan garnitürü de enginarların üzerine paylaştıralım.'
          'Üzerine zeytinyağı limon suyu şeker tuz ve suyu  ekleyerek tencerenin kapağını kapatalım.'
          'Yemeğimiz kaynayıncaya kadar orta ateşte kaynadıktan sonra kısık ateşte enginarlar yumuşayana kadar pişirelim. Bu süreç yaklaşık 20-25 dakika sürecektir.'
          'Pişen enginarlarımızı ocaktan alalım ve soğumaya bırakalım. Ardından servis tabağına alarak suyundan üzerine gezidrelim ve servis edelim. '
          'Üzerini dereotu ile de süsleyebilirsiniz.',
      'Pirinçler bol su ile yıkanarak, ılık tuzlu suda yarım saat kadar bekletilir.'
          'Bu süre sonunda tuzlu suyu akıtılır ve pirinçler sudan geçirilerek tüm suyu süzdürülür.'
          'Pilav tenceresinde tereyağı eritilir sıvı yağ da eklenerek üzerine arpa şehriyeler eklenir.'
          'Şehriyenin rengi dönene kadar kavrulur.'
          'Pirinçler ilave edilerek 2-3 dk daha kavrulur.'
          'Üzerine sıcak su eklenir ve tuzu ilave edilir.'
          'Tencerenin kapağı kapatılarak yüksek ateşte fazla suyu çekip pirinçler göz göz oluncaya kadar yani pirinçlerin üzerinde su çekilip pirinçler göründüğünde kısık ateşe alın ve tamamen suyu çekene kadar pişirin'
          'Ocaktan aldıktan sonra üzerine havlu kağıt koyarak kapağını tekrar kapatın ve demlenmesini bekleyin.'
          'Pilavı güzelce karıştırdıktan sonra servis yapabilirsiniz',
      'Tavuk etini kuşbaşı doğrayın.'
          'Soğanları yemeklik biberleri julyen doğrayın domatesleri de küp küp doğrayın.'
          'Kısık ateşte tavukları arada karıştırarak kavurun.'
          'Suyunu biraz çektikten sonra soğanları ve ince kesilmiş sarımsağı ekleyin.'
          '1-2 dk kavurduktan sonra biberleri ilave edin.'
          'Biberler de sotelenince domatesi salçayı baharatları ve tuzu ekleyip pişirmeye devam edin.'
          'Son olarak 1 bardak suyu ekleyin ve etler pişene kadar kapağı kapalı bir şekilde pişirin.',
      'Eti kuşbaşı doğrayarak yumuşayana kadar haşlayın.'
          'Soğanları yemeklik doğrayarak sıvı yağda pembeleşene kadar kavurun.'
          'Salçayı tuzunu pul biberini ilave edip 2 dakika daha kavurun.'
          'Haşlanmış etleri ve haşlanmış nohutu da ilave ederek bir kaç kez karıştırın.'
          'Daha sonra üzerlerine çıkacak kadar yaklaşık 6 su bardağı kaynamış su koyup beraber biraz daha (10-15 dakika kadar) kaynattıktan sonra ocağı kapatabilirsiniz.. Afiyet olsun…'
    ];
    List<List<String>> yemek = [
      ['Spaghetti', "Makarna", "10 kasım", 'resimler/indir.jpg', aciklma[0]],
      [
        'Mantar Çorbası',
        "Çorba",
        "10 ağustos",
        'resimler/mantarçorbası.jpg',
        aciklma[1]
      ],
      ['Mantı', "Makarna", "10 ocak", 'resimler/mantı.jpg', aciklma[2]],
      ['Köfte', "Et", "10 mart", 'resimler/köfte.jpg', aciklma[3]],
      ['Enginar', "Sebze", "10 şubat", 'resimler/enginar.jpg', aciklma[4]],
      ['Pilav', "Baklagil", "10 temmuz", 'resimler/pilav.jpg', aciklma[5]],
      ['Tavuk Sote', "Et", "10 kasım", 'resimler/tavuksote.jpg', aciklma[6]],
      ['Nohut', "Baklagil", "10 aralık", 'resimler/nohut.jpg', aciklma[7]],
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('YEMEKLER'),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // yan yana iki tane olsun demek
                childAspectRatio:
                    2 / 1, //resmin boyutu 2 genişlikte, 1 boy olsun
              ),
              itemCount: yemek.length,
              itemBuilder: (context, indeks) {
                //döngü gibi çalışır. yemekler listesini döner
                return GestureDetector(
                  onTap: () {
                    List<String> data = [
                      yemek[indeks][0],
                      yemek[indeks][1],
                      yemek[indeks][2],
                      yemek[indeks][4],
                      yemek[indeks][3],
                    ];
                    Navigator.pushNamed(context, "/foodSpecification",
                        arguments: data);
                  },
                  child: Card(
                    //card a benzer bir tasarım yapar.
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<FoodNames>(
                          future: names,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.names![indeks].foodName
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight
                                          .bold, // yemeklerin kalın olması için
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'SEÇ',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight
                                          .bold, // SEÇ yazısının kalın olması için
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ),
                );
              },
            ),
            Lottie.network(
                "https://assets1.lottiefiles.com/packages/lf20_6ySOay.json",
                height: 300),
          ],
        ),
      ),
    );
  }
}
