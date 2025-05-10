import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/project_detail_page/components/project_reviews.dart';
import 'package:readmore/readmore.dart';
import 'package:khedma_link/constants/colors.dart';

class FreelancerProfileScreen extends StatelessWidget {
  final String name;
  final String role;
  final String offeredPrice;

  const FreelancerProfileScreen({
    super.key,
    required this.name,
    required this.role,
    required this.offeredPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: TColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Profile Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [TColors.primary, TColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
            ),

            // Body content
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and role
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const Row(
                        children: [
                          Icon(Iconsax.star1, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text("4.8",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  Text(role, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Price
                  Text("Expected Rate: $offeredPrice",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: TColors.primary)),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Send Message Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle message action
                      },
                      child: const Text("Send Message"),
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Description / Bio
                  const SectionHeading(
                    title: 'About',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Creative and detail-oriented freelancer with 3+ years of experience in UI/UX design and Flutter development. Passionate about building clean and user-centric applications. Available for remote projects and collaborations.',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  const Divider(),

                  // Reviews section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        title: "Reviews (130)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProjectReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 20),
                      )
                    ],
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
