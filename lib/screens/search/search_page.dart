import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/layouts/grid_layout.dart';
import 'package:khedma_link/constants/widgets/appbar/appbar.dart';
import 'package:khedma_link/constants/widgets/appbar/tabbar.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';
import 'package:khedma_link/screens/home_page/components/search_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/search/components/brand_name.dart';
import 'package:khedma_link/screens/search/components/categorytab.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Search",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            MenuIcon(
              onPressed: () {},
              iconColor: Colors.white,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search for service',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      //
                      //Featured Jobs or works
                      SectionHeading(
                          title: 'Featured sevices', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      //
                      //grid
                      GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          iteamBuilder: (_, index) {
                            return const BrandCart(
                              showBorder: false,
                            );
                          })
                    ],
                  ),
                ),
                //
                //Tabs
                bottom: const SearchTabbar(
                  tabs: [
                    Tab(
                      child: Text("Coding"),
                    ),
                    Tab(
                      child: Text("Designing"),
                    ),
                    Tab(
                      child: Text("Video & Animation"),
                    ),
                    Tab(
                      child: Text("Writing & Translation"),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
