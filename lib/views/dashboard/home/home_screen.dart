import 'dart:async';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:kheloo/shared/constants/app_image.dart';
import 'package:kheloo/shared/constants/app_strings.dart';
import 'package:kheloo/utils/ui_text_style.dart';
import 'package:kheloo/views/dashboard/home/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SwiperController swiperController = SwiperController();

  StreamController<int> numericController = StreamController<int>.broadcast();
  late Timer timer;
  int initialNumber = 1234567;

  @override
  void initState() {
    super.initState();
    numericController.sink.add(initialNumber);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      numericController.sink.add(initialNumber++);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    swiperController.dispose();
    numericController.close();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width,
        child: Swiper(
          autoplay: true,
          controller: swiperController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            String singleItem = AppImage.banners[index];
            return Image.network(
              singleItem,
              fit: BoxFit.fill,
            );
          },
          pagination: SwiperPagination(
              builder: SwiperCustomPagination(
            builder: (context, config) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                AppImage.banners.length,
                (int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 10),
                    width: 20.0,
                    height: 1.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: config.activeIndex == index
                          ? Border.all(
                              width: 2.0, color: AppColor.yelloGradientEnd)
                          : Border.all(width: 0),
                      color: AppColor.greyColor,
                    ),
                  );
                },
              ),
            ),
          )),
          outer: true,
          itemCount: AppImage.banners.length,
          layout: SwiperLayout.DEFAULT,
        ),
      ),

// Languages

      Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImage.icLangStrip,
                  ),
                  fit: BoxFit.fitWidth)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...AppStrings.langs
                      .map(
                        (e) => GestureDetector(
                            onTap: null,
                            child: Text(
                              e,
                              maxLines: 1,
                              style: UITextStyle.regularTextStyle(
                                  color: AppColor.yellowColor),
                            )),
                      )
                      .toList()
                      .sublist(0, 5),
                  GestureDetector(
                      onTap: null,
                      child: Text(
                        '...',
                        maxLines: 1,
                        style: UITextStyle.regularTextStyle(
                            color: AppColor.yellowColor),
                      ))
                ]),
          )),
      const SizedBox(height: 80.0),

// jackpot
      Center(
        child: SizedBox(
          height: 145.0,
          width: 320.0,
          child: Stack(
            children: [
              Image.asset(AppImage.icJackpot),
              Positioned(
                top: 57,
                left: 58,
                child: StreamBuilder<int>(
                  initialData: 1234567,
                  stream: numericController.stream,
                  builder: (context, snapshot) => Text(
                    '${snapshot.data}',
                    style: UITextStyle.boldTextStyle(
                      fontSize: 40,
                      characterSpacing: 13,
                      color: AppColor.jackpotTextRedColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      const SizedBox(height: 20),

//   Live withdrawal
      const GradientHeading(title: "LIVE WITHDRAWAL"),

      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.icWithdrawalBoard), fit: BoxFit.fill),
        ),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 3,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            LiveWithdrawalAdaptor(name: "Ashish", amount: "1236", time: "5"),
            LiveWithdrawalAdaptor(name: "Ashish", amount: "1236", time: "5"),
            LiveWithdrawalAdaptor(name: "Ashish", amount: "1236", time: "5"),
            LiveWithdrawalAdaptor(name: "Ashish", amount: "1236", time: "5"),
          ],
        ),
      ),

//  player
      HtmlWidget(
        '''<iframe src="https://player.vimeo.com/video/759401631?h=27f2be5876" height="100%" width="100%" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen=""></iframe>''',
        onErrorBuilder: (context, element, error) =>
            Text('$element error playing video : $error'),
        onLoadingBuilder: (context, element, loadingProgress) =>
            const CircularProgressIndicator(),
      ),

      const SizedBox(height: 20),

//  Games title
      GradientHeading(title: 'Games'.toUpperCase()),
      const SizedBox(height: 10),
      const GamesSection(
        title: 'Most Popular',
        games: [
          "https://cdn.hub88.io/spribe/sbe_aviator.png",
          "https://luckmedia.link/evo_monopoly_live/thumb.webp",
          "https://luckmedia.link/roy_teen_patti/thumb.webp",
          "https://luckmedia.link/tvb_teen_patti/thumb.webp",
          "https://luckmedia.link/evo_teen_patti/thumb.webp",
          "https://luckmedia.link/kng_teen_patti/thumb.webp",
          "https://luckmedia.link/ezg_andar_bahar/thumb.webp",
          "https://luckmedia.link/ezg_andar_bahar_lobby/thumb.webp"
        ],
      ),
      const GamesSection(
        title: ' Live Dealer',
        games: [
          "https://cdn.hub88.io/spribe/sbe_aviator.png",
          "https://luckmedia.link/evo_monopoly_live/thumb.webp",
          "https://luckmedia.link/roy_teen_patti/thumb.webp",
          "https://luckmedia.link/tvb_teen_patti/thumb.webp",
          "https://luckmedia.link/evo_teen_patti/thumb.webp",
          "https://luckmedia.link/kng_teen_patti/thumb.webp",
          "https://luckmedia.link/ezg_andar_bahar/thumb.webp",
          "https://luckmedia.link/ezg_andar_bahar_lobby/thumb.webp",
          "https://cdn.hub88.io/spribe/sbe_aviator.png",
          "https://luckmedia.link/evo_monopoly_live/thumb.webp",
          "https://luckmedia.link/roy_teen_patti/thumb.webp",
          "https://luckmedia.link/tvb_teen_patti/thumb.webp",
          "https://luckmedia.link/evo_teen_patti/thumb.webp",
          "https://luckmedia.link/kng_teen_patti/thumb.webp",
          "https://luckmedia.link/ezg_andar_bahar/thumb.webp",
          "https://luckmedia.link/ezg_andar_bahar_lobby/thumb.webp"
        ],
      ),
      const SizedBox(height: 33),
    ]);
  }
}
