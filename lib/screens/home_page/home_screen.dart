import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/home_categoeies.dart';
import 'package:khedma_link/screens/home_page/components/list_of_projects.dart';
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
                  HomeTAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SearchContainer(text: "Search for service"),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Active Projects',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        HomeCategories(),
                        SizedBox(height: TSizes.spaceBtwSections),
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
                  SectionHeading(
                    title: 'Pending projects',
                    onPressed: () {},
                    showActionButton: false,
                  ),
                  const ListOfProject(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
