import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/custom_scaffold.dart';
import 'package:tailor_company_mobile/widgets/divider_needle.dart';
import 'package:tailor_company_mobile/widgets/product_card.dart';
import 'package:tailor_company_mobile/widgets/product_container.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';
import 'package:tailor_company_mobile/widgets/product_status.dart';

const dummy = [
  ProductInfo(
      url: AppAssets.designerImage,
      name: "new fashion",
      quantity: 3,
      size: "L"),
  ProductInfo(
      url: AppAssets.designerImage,
      name: "new fashion",
      quantity: 3,
      size: "L"),
  ProductInfo(
      url: AppAssets.designerImage,
      name: "new fashion",
      quantity: 3,
      size: "L"),
  ProductInfo(
      url: AppAssets.designerImage,
      name: "new fashion",
      quantity: 3,
      size: "L"),
  ProductInfo(
      url: AppAssets.designerImage,
      name: "new fashion",
      quantity: 3,
      size: "L"),
  ProductInfo(
      url: AppAssets.designerImage,
      name: "new fashion",
      quantity: 3,
      size: "L"),
];

const seasonDummy = [
  SeasonalInfo(
      url: AppAssets.seasonPic,
      season: "HOLI",
      desc:
          "Celebrating Vibrant Style and Colorful Traditions! Dive into a world where traditional hues blend seamlessly with modern trends."),
  SeasonalInfo(
      url: AppAssets.seasonPic,
      season: "HOLI",
      desc:
          "Celebrating Vibrant Style and Colorful Traditions! Dive into a world where traditional hues blend seamlessly with modern trends."),
  SeasonalInfo(
      url: AppAssets.seasonPic,
      season: "HOLI",
      desc:
          "Celebrating Vibrant Style and Colorful Traditions! Dive into a world where traditional hues blend seamlessly with modern trends."),
  SeasonalInfo(
      url: AppAssets.seasonPic,
      season: "HOLI",
      desc:
          "Celebrating Vibrant Style and Colorful Traditions! Dive into a world where traditional hues blend seamlessly with modern trends."),
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Status productStatus = Status.newOrder;

  void onStatusChange(Status status) {
    setState(() {
      productStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 68),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Hello Naveen",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.primary,
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  StringConstants.goodMorning,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.secondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProductContainer(
                    soldProduct: "12",
                    totalEarned: "20000",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 92,
                    alignment: Alignment.bottomCenter,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: ColorConstants.primary,
                    ),
                    child: Image.asset(
                      AppAssets.arrowOutward,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const DividerNeedle(),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductStatus(
                    status: productStatus,
                    onStatusChange: onStatusChange,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      StringConstants.viewAll,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.koeksister,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 178,
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.45,
                  scrollDirection: Axis.horizontal,
                  children: dummy
                      .map((e) => ProductCard(
                          imageUrl: e.url,
                          name: e.name,
                          quantity: e.quantity,
                          size: e.size))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const DividerNeedle(),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  StringConstants.seasonalBlogs,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.primary),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 160,
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 1,
                    mainAxisSpacing: 8,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    childAspectRatio: 0.45,
                    scrollDirection: Axis.horizontal,
                    children: seasonDummy
                        .map((e) => Container(
                              width: 280,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: ColorConstants.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(1, 2),
                                    blurRadius: 4,
                                    color:
                                        ColorConstants.black.withOpacity(0.08),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ProductImageContainer(
                                      url: AppAssets.seasonPic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    e.desc,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.primary,
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductInfo {
  final String url;
  final String name;
  final int quantity;
  final String size;

  const ProductInfo({
    required this.url,
    required this.name,
    required this.quantity,
    required this.size,
  });
}

class SeasonalInfo {
  final String url;
  final String season;
  final String desc;

  const SeasonalInfo({
    required this.url,
    required this.season,
    required this.desc,
  });
}
