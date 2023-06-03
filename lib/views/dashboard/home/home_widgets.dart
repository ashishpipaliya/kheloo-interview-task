import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:kheloo/shared/constants/app_image.dart';
import 'package:kheloo/utils/ui_text_style.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/gradient_text.dart';

class GradientHeading extends StatelessWidget {
  final String title;
  const GradientHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientText(title,
            style: UITextStyle.boldTextStyle(fontSize: 30),
            gradient: LinearGradient(
              colors: [
                AppColor.yelloGradientEnd,
                AppColor.yelloGradientEnd,
                AppColor.white,
                AppColor.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        Container(
            margin: const EdgeInsets.only(top: 8),
            color: AppColor.yellowColor,
            width: MediaQuery.of(context).size.width * 0.35,
            height: 3),
      ],
    );
  }
}

class LiveWithdrawalAdaptor extends StatelessWidget {
  final String name;
  final String amount;
  final String time;
  const LiveWithdrawalAdaptor(
      {super.key,
      required this.name,
      required this.amount,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 28,
            width: 28,
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: AppColor.orangeColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                AppImage.icUser,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Flexible(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "$name ",
                  style: UITextStyle.regularTextStyle(
                      color: AppColor.white, fontSize: 10)),
              TextSpan(
                  text: "₹",
                  style: UITextStyle.regularTextStyle(
                      color: AppColor.orangeColor, fontSize: 10)),
              TextSpan(
                  text: amount,
                  style: UITextStyle.boldItalicTextStyle(
                      color: AppColor.white, fontSize: 10)),
              const TextSpan(text: "\n"),
              TextSpan(
                  text: "$time second ago",
                  style: UITextStyle.thinTextStyle(
                      fontSize: 8, color: AppColor.white)),
            ])),
          )
        ],
      ),
    );
  }
}

class GamesHeader extends StatelessWidget {
  final String title;
  final String count;
  final Function()? onViewMore;
  final bool isExpanded;
  const GamesHeader(
      {super.key,
      required this.title,
      required this.count,
      this.onViewMore,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 36,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 6.0,
                    decoration: BoxDecoration(
                        color: AppColor.yellowColor,
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(colors: [
                          AppColor.yellowGradientStart,
                          AppColor.yelloGradientEnd
                        ])),
                    margin: const EdgeInsets.only(right: 15)),
                Text(
                  "$title ($count)",
                  style: UITextStyle.boldTextStyle(
                      color: AppColor.white, fontSize: 18),
                ),
              ],
            ),
            GestureDetector(
              onTap: onViewMore,
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                constraints: const BoxConstraints(minWidth: 80),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(colors: [
                      AppColor.yellowGradientStart,
                      AppColor.yelloGradientEnd
                    ])),
                child: Text(
                  isExpanded ? "Hide" : "Show More",
                  style: UITextStyle.semiBoldTextStyle(
                      color: AppColor.white, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GameAdaptor extends StatelessWidget {
  final String image;
  final int index;
  const GameAdaptor({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    int row = index ~/ 2; // Assuming 2 items per row
    bool isTop = row % 2 == 0;
    bool isLeft = index % 2 == 0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.network(image, fit: BoxFit.cover, height: double.maxFinite),
          Positioned(
            left: isLeft ? 0 : null,
            right: isLeft ? null : 0,
            top: isTop ? 0 : null,
            bottom: isTop ? null : 0,
            child: isTop && isLeft
                ? Image.asset(AppImage.icGameCorner)
                : const SizedBox.shrink(),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.darkPurpleColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Min.",
                        style:
                            UITextStyle.boldTextStyle(color: AppColor.white)),
                            TextSpan(
                        text: "₹",
                        style:
                            UITextStyle.boldTextStyle(color: AppColor.yellowColorAlt)),
                    TextSpan(
                        text: "200",
                        style:
                            UITextStyle.boldTextStyle(color: AppColor.white)),
                               TextSpan(
                        text: " | ",
                        style:
                            UITextStyle.boldTextStyle(color:AppColor.yellowColorAlt)),
                    TextSpan(
                        text: "Max.",
                        style:
                            UITextStyle.boldTextStyle(color: AppColor.white)),
                    TextSpan(
                        text: "₹",
                        style:
                            UITextStyle.boldTextStyle(color: AppColor.yellowColorAlt)),
                              TextSpan(
                        text: "₹100k",
                        style:
                            UITextStyle.boldTextStyle(color: AppColor.white)),
                  ])))),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: AppColor.orangeColor),
            ),
          ),
        ],
      ),
    );
  }
}

class GamesSection extends StatefulWidget {
  final String title;
  final List<String> games;

  const GamesSection({super.key, required this.title, required this.games});

  @override
  State<GamesSection> createState() => _GamesSectionState();
}

class _GamesSectionState extends State<GamesSection> {
  bool isListExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GamesHeader(
            title: widget.title,
            count: '${widget.games.length}',
            isExpanded: isListExpanded,
            onViewMore: () {
              isListExpanded = !isListExpanded;
              setState(() {});
            }),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          itemCount: (!isListExpanded && widget.games.length > 4)
              ? 4
              : widget.games.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            return GameAdaptor(image: widget.games[index], index: index);
          },
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
