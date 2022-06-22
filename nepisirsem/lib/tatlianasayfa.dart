import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'api/api_source.dart';
import 'package:http/http.dart' as http;

class tatlianasayfa extends StatefulWidget {
  const tatlianasayfa({Key? key}) : super(key: key);

  @override
  State<tatlianasayfa> createState() => _tatlianasayfaState();
}

class _tatlianasayfaState extends State<tatlianasayfa> {
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
    List<String> aciklamaTatli = [
      "Magnolianın muhallebisi için uygun bir tencereye süt,  toz şeker, un, yumurta ve  sıvı kremayı alalım."
          "Malzemelerimizi tel çırpıcıyla karıştırarak pişirmeye başlayalım."
          "Muhallebi koyulaşıp göz göz oluncaya kadar karıştırarak pişirelim ve ardından ocağı kapatalım."
          "İçerisine vanilya ilave ederek şöyle bir karıştırdıktan sonra muhallebiyi uygun bir karıştırma kabının içerisine alalım."
          "Muhallebimiz beklerken üzerini streç filmle kapatalım. Böylelikle üzerinin kabuklanmasını engellemiş oluruz."
          "Diğer taraftan bebe bisküvisi ve  kavrulmuş fındığı rondoya alalım ve hızlıca rondodan geçirelim."
          "Soğuyan muhallebiyi mikserle iki dakika kadar çırpalım. Artık tatlıyı sunum yapacağımız kuplara doldurmaya başlayabiliriz."
          "Şimdi kupların tabanına ilk olarak fındıklı bisküvi karışımını yerleştirelim. Sizlerde kaşığın arkasıyla düzeltirseniz çok daha güzel bir görünüm elde edebilirsiniz."
          "Ardından kuplarımızın kenarlarına dilimlenmiş çilekleri yerleştirelim."
          "Çilekleri sıraladıktan sonra muhallebiyi kuplara paylaştıralım."
          "Muhallebinin üzerini de yine kaşığın arka tarafı ile düzeltelim."
          "Son olarak muhallebinin üzerine tekrardan hazırladığımız fındıklı bisküvi karışımından yerleştirelim."
          "Magnoliamızın üzerini dilimlenmiş çilekle süsleyelim."
          "Bu şekilde tatlılarımızı en az 2-3 saat kadar buzdolabında dinlendirdikten sonra çilekli magnolialarımız servise hazır."
          "Afiyet olsun!",
      "2 su bardağı sıcak su ile 1,5 su bardağı şekeri minik bir tencereye alarak kaynattım."
          "Kaynamaya başladıktan 5-6 dk. sonra altını kapatarak."
          "Şerbeti 10 dakika kadar beklettim."
          "Eğer şerbeti karamelize edilmiş istiyorsanız önce şekeri tencerede kavurun videoda anlatıldığı gibi üzerine su ekleyerek şerbeti hazırlayabilirsiniz."
          "Bu arada da genişçe bir borcama 12 tane etimeği güzelce sıraladım."
          "Kepçe yardımı ile şerbeti etimeklerin her yerine gelecek şekilde dağıttım."
          "Etimekler ıslanırken hemen muhallebiyi hazırlamaya başladım."
          "Tarifin aslında malzemeler 750ml süte göre verilmişti ama ben tepsim geniş olduğu için 1 litre süt ile hazırladım."
          "Eğer sizde küçük bir tepsiye yapıyorsanız etimek sayısına göre malzemenizi ayarlayabilirsiniz."
          "1 litre sütün içine vanilya ve tereyağı hariç tüm muhallebi malzemelerini ekledim ve iyice çırptıktan sonra kaynayana kadar karıştırarak muhallebiyi hazırladım."
          "Kaynamaya başladıktan sonra vanilya ve tereyağı ilave ederek 2-3 dk. kadar daha karıştırdım ve ocağı kapattım."
          "Muhallebi 5 dakika kadar dinlendikten sonra etimeklerin üzerine dökerek yüzeyini düzelttim."
          "Krem şantiyi tatlının üzerine dökmeden önce iyice soğuması için tatlıyı beklemeye aldım."
          "Eğer muhallebinin soğumasını beklemezseniz krem şanti eriyerek kötü bir görüntü oluşturur bu nedenle soğuduğundan emin olmadan krem şantiyi eklemeyin."
          "Soğuyan tatlının üzerine 1 su bardağı süt ile hazırladığım krem şantiyi hazırlayarak sürdüm."
          "Üzerini streç film ile kapatarak buz dolabına kaldırdım.",
      "Tatlımızın hamuru için; derin bir kabın içerisine suyu, sıvı yağı, şekeri, vanilyayı alalım."
          "Unu da hamurumuz ele yapışmayacak bir kıvam alana kadar yavaş yavaş ekleyelim ve karıştırıp, yoğuralım."
          "Kıvam alan hamurumuzun üzerini streç film ile kapatalım ve 20 dakika kadar dinlenmeye bırakalım."
          "Hamurumuza şekil verme aşamasına geçmeden önce, fırınımızı en yüksek derecede alt-üst ayarında çalıştıralım."
          "Dinlenen hamurumuzu tezgaha alalım ve elimizle rulo şekli verelim."
          "Daha sonra hamur kesme aparatı ya da bıçak yardımı ile hamurumuzu 18 parçaya ayıralım ve küçük küçük bezeler haline getirelim."
          "Hazırladığımız bezelerden bir tanesini alalım, elimiz ile bastırarak hafifçe genişletelim."
          "Daha sonra oklava yardımı ile hamurumuzu ince bir şekilde açalım."
          "Hamur yağlı olduğu için açma işlemini zorlanmadan, kolayca yapabilirsiniz."
          "Açtığımız hamurun ortasına kakaolu fındık kremasından kaşık ile koyalım ve bohça şeklinde kapatalım."
          "Hamuru açıklık kalmayacak şekilde kapatalım, fazla gelen kısım olur ise makas yardımı ile keselim."
          "Fırın tepsimize pişirme kağıdını yerleştirelim. Hamurun tepsiye yapışmaması ve tepsinin kirlenmemesi için tercih ediyorum."
          "Hazırladığımız İzmir bombamızı topladığımız kısım alta gelecek şekilde, pişirme kağıdı serdiğimiz fırın tepsisine alalım."
          "Tüm bezelerimiz bitene kadar, sırası ile aynı işlemi uygulayalım."
          "Ben iki tepside pişirdim, birbirine çok yakın yerleştirmemenizi ve şekillendirme kısmını hızlıca yapmanızı öneririm, çünkü bekledikçe hamur genişliyor."
          "Tatlımızı fırına sürelim ve fırınımızın ayarını 220°C’ye düşürelim, fanlı olarak pişirelim. Pişirme işlemini fırının başından ayrılmadan, dikkatli bir şekilde pişirmelisiniz."
          "Tatlımız 5-6 dakika içerisinde pişecektir."
          "İlk sıcağı çıkan İzmir bombalarını, servis tabağına alarak dilediğiniz gibi servis edebilirsiniz.",
      "Havuçlu cevizli kek için öncelikle havuçlar yıkanıp soyularak rendelenir. Suyunu sıkmayı unutmayın!"
          "Derin bir kapta yumurta ve şeker mikser ile köpük köpük olana kadar iyice çırpılır."
          "Süt ve sıvı yağ eklenerek karıştırılır."
          "Un, kabartma tozu ve vanilya elenerek eklenir."
          "Kıvamına göre un miktarını ayarlayın."
          "Malzemeler bir kez daha mikserle karıştırılıp içerisine havuç, ceviz ve tarçın ilave edilir."
          "Tahta bir kaşıkla son kez karıştırılır."
          "Kullanılacak kek kabı yağlandıktan sonra karışım kaba alınır."
          "170 derecede önceden ısıtılmış fırında yaklaşık 40 dakika pişirilir."
          "İlk yarım saat fırının kapağını açmayınız ki kekiniz daha güzel kabarsın. :)"
          "Fırından aldığımız keki kalıptan daha kolay çıkartmak için soğumaya bırakalım."
          "Yeterince soğumadan çıkartmaya çalışırsanız kekiniz parçalanabilir."
          "Soğuyan keki kalıptan rahatça çıkartalım.",
      "İlk olarak, 26 cm çapındaki kelepçeli kalıbımızın tabanını pişirme kağıdı ile kaplayalım."
          "Çırpma kabına yumurta ve şekeri alarak, beyazlaşıncaya kadar çırpalım."
          "1 çay bardağı sütü ekledikten sonra; un, kakao, vanilya ve  kabartma tozunu eleyerek karışıma ilave edelim."
          "Malzemelerimiz güzelce karışıncaya kadar çırpalım."
          "Kek hamurumuzu, kelepçeli kalıba boşaltalım."
          "Önceden ısıttığımız 170 °C fırında, yaklaşık 25-30 dakika pişirelim."
          "Fırından aldıktan sonra, soğumaya bırakalım."
          "Üzeri için, krem şantiyi süt ile koyulaşıncaya kadar çırpalım."
          "Hindistan cevizi ve pudra şekeri ekleyerek, güzelce karıştıralım."
          "Çikolata ganajı için, sıvı kremayı kaynama noktasına gelinceye kadar ısıtalım."
          "Çikolatayı ekleyerek, eriyinceye kadar karıştıralım."
          "Biz çikolatanın 100 gramını sütlü, 60 gramını bitter çikolata kullandık."
          "Soğuyan kekimizin üzerine, sütümüzü gezdirerek ıslatalım."
          "Hazırladığımız Hindistan cevizli karışımı, kekimizin üzerine boşaltarak üzeri tamamen düz olacak şekilde yayalım."
          "Son olarak iyice soğumuş olan çikolata sosumuzu, pastanın üzerine dökelim ve 3-4 saat buzdolabında dinlendirelim."
          "Daha sonra üzerini dilediğiniz şekilde süsleyerek, servis edebilirsiniz.",
      "Sütlaç yapmak için öncelikle pirinci yıkayıp su ile ateşe koyun."
          "Pirinçler uzayıp suyu çekene kadar kaynatın, soğuk sütü ekleyin."
          "1-2 defa karıştırıp, kaynamasını bekleyin."
          "Bu arada bir kasede pirinç ununu 1 su bardağı soğuk süt ile ezin."
          "Tencerede kaynamakta olan sütten 1-2 kepçe alıp kaseye ekleyin. (pirinç unu ılınmış olmalı)."
          "Pirinç ununu tencereye ekleyin, ara sıra karıştırarak 10 dakika kadar pişirin."
          "Toz şekeri ilave edip karıştırın ve 1-2 taşım kaynatın."
          "Sütlacı kaselere paylaştırın."
          "Soğuyunca sütlaçların üzerlerine tarçın serperek servis edebilirsiniz. Afiyet olsun.",
      "Malzemelerin tamamını hamur yoğurma kabına alarak azar azar un ekleyelim ve hamurumuzu yoğuralım."
          "Un miktarını elinize yapışmayacak kıvama gelene kadar ekleyerek ayarlayabilirsiniz."
          "Ben 3,5 su bardağı un kullandım yeterli oldu ancak tahinin yoğunluğuna göre miktar değişebilir bu nedenle önce 3 bardak ekleyerek sonra gerekirse ilave edebilirsiniz."
          "Bu kurabiyenin hamuru tam olarak bütünleşmez ama şekil vermesi de zor değildir."
          "Eliniz ile sıktığınızda şekil alacaktır."
          "Hamuru yoğurma işlemi bittiğinde kurabiyeleri ceviz büyüklüğünde elinizde yuvarlayın."
          "Kurabiyelerin üst kısmını önce yumurta akına batırın daha sonra kırılmış cevize bulayın."
          "Pişirme kağıdı serdiğiniz fırın tepsisine aralarında boşluk olacak şekilde sıralayın."
          "Ben 30 adet kurabiye elde ettim."
          "Kurabiyelerimizi yaklaşık 180 derece önceden ısıtılmış fırında  hafif pembeleşinceye kadar yaklaşık 30 dakika pişirelim.",
      "Öncelikle muhallebi için şeker, un, süt ve yumurta çırpılarak ocakta kaynayıncaya kadar karıştırılarak pişirilir."
          "Kaynadıktan sonra altı kapatılarak ılımaya bırakılır."
          "15 dk kadar bekleyip ılındıktan sonra labne peyniri ilave edilip mikser ile pürüzsüz hale gelene kadar çırpılır."
          "Diğer taraftan sıcak su içinde hazır kahve çözdürülerek hazırlanır ve hafif soğuması beklenir."
          "Servis tabağına pandispanya kekinin bir katı yerleştirilerek kahvenin yarısı ile ıslatılır."
          "Üzerine kremanın yarısı ilave edilip kalan kahve ile üst kat da ıslatıldıktan sonra ikinci kat kapatılır."
          "Kalan krema pastanın üzerine dökülerek pastanın üzeri ve kenarları güzelce kapatılır."
          "Son olarak pastanın üzerine süzgeç yardımı ile kakao serpilir."
          "Buzdolabında birkaç saat dinlendirildikten sonra dilimlenerek servis edilir."
    ];

    List<List<String>> tatli = [
      [
        'Magnolia',
        "Sütlü",
        "10 kasım",
        'resimler/magnolia.jpg',
        aciklamaTatli[0]
      ],
      [
        'Etimek',
        "Şerbetli",
        "10 ağustos",
        'resimler/etimek.png',
        aciklamaTatli[1]
      ],
      [
        'İzmir bomba',
        "Kurabiye",
        "10 ocak",
        'resimler/izmirbomba.jpg',
        aciklamaTatli[2]
      ],
      [
        'Havuçlu Cevizli Kek',
        "Kek",
        "10 mart",
        'resimler/havuclucevizlikek.jpg',
        aciklamaTatli[3]
      ],
      [
        'Cocostar Pasta',
        "Pasta",
        "10 şubat",
        'resimler/cocostarpasta.jpg',
        aciklamaTatli[4]
      ],
      ['Sütlaç', "Sütlü", "10 temmuz", 'resimler/sutlac.jpg', aciklamaTatli[5]],
      [
        'Tahinli Kurabiye',
        "Kurabiye",
        "10 şubat",
        'resimler/tahinlicevizlikurabiye.jpg',
        aciklamaTatli[6]
      ],
      [
        'Tiramisu',
        "Pasta",
        "10 temmuz",
        'resimler/tiramisu.jpg',
        aciklamaTatli[7]
      ]
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TATLILAR'),
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
                crossAxisCount: 2,
                childAspectRatio:
                    2 / 1, //resmin boyutu 2 genişlikte, 1 boy olsun
              ),
              itemCount: tatli.length,
              itemBuilder: (context, indeks) {
                //döngü gibi çalışır. yemekler listesini döner
                return GestureDetector(
                  onTap: () {
                    List<String> data = [
                      tatli[indeks][0],
                      tatli[indeks][1],
                      tatli[indeks][2],
                      tatli[indeks][4],
                      tatli[indeks][3],
                    ];
                    Navigator.pushNamed(context, "/sweetSpecification",
                        arguments: data);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<FoodNames>(
                          future: names,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot
                                          .data!.names![indeks + 8].sweetName
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
                                ),
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
                "https://assets8.lottiefiles.com/packages/lf20_2eqljfq6.json",
                height: 200),
          ],
        ),
      ),
    );
  }
}
