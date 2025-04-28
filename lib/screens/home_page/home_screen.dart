import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/layouts/grid_layout.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/home_categoeies.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/job_card_vertical.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/promo_slider.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/search_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTAppBar(), // this is the app bar
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  SearchContainer(
                    //this is the search conatainer
                    text: "Search for service",
                  ),
                  //
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(
                      left: TSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        //heading
                        SectionHeading(
                          title: 'Pending Activites',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        // the categoris body
                        HomeCategories()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(
                    banners: [
                      'assets/banner/become_freelancer.jpg',
                      'assets/banner/Start an online business.webp',
                      'assets/banner/find_your_team.jpg',
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //Heading
                  SectionHeading(
                    title: 'Recommended',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  GridLayout(
                    itemCount: 2,
                    iteamBuilder: (_, index) => const JobCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
