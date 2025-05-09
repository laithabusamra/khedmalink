import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

class ProjectDetail extends StatefulWidget {
  final String projectId;
  final String title;
  final String description;
  final double suggestedPrice;
  final bool completed;

  const ProjectDetail({
    super.key,
    required this.projectId,
    required this.title,
    required this.description,
    required this.suggestedPrice,
    required this.completed,
  });

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isFixedPrice = true;
  final TextEditingController _fixedPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fixedPriceController.text = widget.suggestedPrice.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        backgroundColor: TColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status indicator and title row
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.completed ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Project Description
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Pricing Type Selection
            const Text(
              'Select Pricing Type:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _isFixedPrice,
                  onChanged: (value) => setState(() => _isFixedPrice = value!),
                ),
                const Text('Fixed Price'),
                const SizedBox(width: 20),
                Radio<bool>(
                  value: false,
                  groupValue: _isFixedPrice,
                  onChanged: (value) => setState(() => _isFixedPrice = value!),
                ),
                const Text('Hourly Rate'),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Dynamic Price Input
            if (_isFixedPrice)
              TextFormField(
                controller: _fixedPriceController,
                decoration: const InputDecoration(
                  labelText: 'Your Price',
                  prefixText: '\$',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
              )
            else
              Column(
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'The price will be \$${widget.suggestedPrice} per hour',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitProposal,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('SUBMIT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitProposal() {
    if (_isFixedPrice && _fixedPriceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a fixed price')),
      );
      return;
    }

    final price = _isFixedPrice
        ? double.tryParse(_fixedPriceController.text) ?? 0
        : widget.suggestedPrice;

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFixedPrice
              ? 'Fixed price proposal of \$$price submitted!'
              : 'Hourly rate proposal of \$${widget.suggestedPrice}/hour submitted!',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fixedPriceController.dispose();
    super.dispose();
  }
}
// class ProjectDetail extends StatelessWidget {
//   const ProjectDetail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const ProjectImage(),
//             Padding(
//               padding: const EdgeInsets.only(
//                   right: TSizes.defaultSpace,
//                   left: TSizes.defaultSpace,
//                   bottom: TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   //
//                   //rating and share
//                   const RatingAndShare(),
//                   //
//                   //Price and title and provider name

//                   const ProjectMetaData(),
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections,
//                   ),

//                   //send message
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: () {}, child: const Text("Send Message")),
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections,
//                   ),
//                   //description
//                   const SectionHeading(
//                     title: 'Description',
//                     showActionButton: false,
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwItems,
//                   ),
//                   const ReadMoreText(
//                     ' we are looking for a designer how can deal with your job we prefer 3 years of experience and a good portfolio and good english to make sure that both side can work clearly',
//                     trimLines: 2,
//                     trimMode: TrimMode.Line,
//                     trimCollapsedText: 'Show more',
//                     trimExpandedText: 'less',
//                     moreStyle:
//                         TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
//                     lessStyle:
//                         TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
//                   ),

//                   //reviews
//                   const Divider(),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const SectionHeading(
//                         title: "Reviews(130)",
//                         showActionButton: false,
//                       ),
//                       IconButton(
//                         onPressed: () =>
//                             Get.to(() => const ProjectReviewsScreen()),
//                         icon: const Icon(Iconsax.arrow_right_3, size: 20),
//                       )
//                     ],
//                   ),

//                   const SizedBox(height: TSizes.spaceBtwSections),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
