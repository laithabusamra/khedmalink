import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/home_categoeies.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/search_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/home_page/components/vertical_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
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
                          title: 'Popular jobs',
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
