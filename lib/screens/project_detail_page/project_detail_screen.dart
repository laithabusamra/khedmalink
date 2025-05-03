import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/project_meta_data.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/project_detail_page/components/project_image.dart';
import 'package:khedma_link/screens/project_detail_page/components/project_reviews.dart';
import 'package:khedma_link/screens/project_detail_page/components/rating_share.dart';
import 'package:readmore/readmore.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProjectImage(),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  //
                  //rating and share
                  const RatingAndShare(),
                  //
                  //Price and title and provider name

                  const ProjectMetaData(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //send message
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Send Message")),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //description
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    ' we are looking for a designer how can deal with your job we prefer 3 years of experience and a good portfolio and good english to make sure that both side can work clearly',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        title: "Reviews(130)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProjectReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 20),
                      )
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
