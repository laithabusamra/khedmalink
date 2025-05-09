import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/layouts/grid_layout.dart';
import 'package:khedma_link/constants/widgets/appbar/tabbar.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';
import 'package:khedma_link/screens/home_page/components/search_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/search/components/brand_name.dart';
import 'package:khedma_link/screens/search/components/categorytab.dart';
import 'package:khedma_link/screens/search/components/filter_sheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TColors.white,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Search",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          automaticallyImplyLeading: false,
          actions: [
            MenuIcon(
              onPressed: () {},
              iconColor: Colors.black,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: TColors.white,
                expandedHeight: 440,
                flexibleSpace: Container(
                  color: TColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Row(
                          children: [
                            const Expanded(
                              child: SearchContainer(
                                text: 'Search for service',
                                showBorder: true,
                                showBackground: false,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (_) => const FilterSheets(),
                                );
                              },
                              icon: const Icon(Icons.filter_list),
                              tooltip: "Filter",
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        SectionHeading(
                          title: 'Featured sevices',
                          onPressed: () {},
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          iteamBuilder: (_, index) {
                            return const BrandCart(
                              showBorder: false,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                bottom: const SearchTabbar(
                  tabs: [
                    Tab(child: Text("Coding")),
                    Tab(child: Text("Designing")),
                    Tab(child: Text("Video & Animation")),
                    Tab(child: Text("Writing & Translation")),
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
