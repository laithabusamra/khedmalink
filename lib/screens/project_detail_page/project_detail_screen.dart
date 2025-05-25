import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

class ProjectDetail extends StatefulWidget {
  final String projectId;
  final String title;
  final String description;
  final double suggestedPrice;

  const ProjectDetail({
    super.key,
    required this.projectId,
    required this.title,
    required this.description,
    required this.suggestedPrice,
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
  void dispose() {
    _fixedPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        backgroundColor: TColors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Status and Title
            Row(
              children: [
                const SizedBox(width: TSizes.sm),
                Expanded(
                  child: Text(
                    widget.title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Description
            Text(
              widget.description,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Pricing Options
            Text(
              'Select Pricing Type:',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: TSizes.sm),
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
            const SizedBox(height: TSizes.spaceBtwItems),

            // Price input
            if (_isFixedPrice)
              TextFormField(
                controller: _fixedPriceController,
                decoration: const InputDecoration(
                  labelText: 'Your Fixed Price',
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                ),
                child: Text(
                  'Hourly rate: \$${widget.suggestedPrice.toStringAsFixed(2)}/hr',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _canSubmit() ? _submitProposal : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
                child:
                    const Text('SUBMIT', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canSubmit() {
    if (_isFixedPrice) {
      final text = _fixedPriceController.text.trim();
      return text.isNotEmpty && double.tryParse(text) != null;
    }
    return true;
  }

  void _submitProposal() {
    final price = _isFixedPrice
        ? double.tryParse(_fixedPriceController.text.trim()) ?? 0
        : widget.suggestedPrice;

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFixedPrice
              ? 'Fixed price proposal of \$${price.toStringAsFixed(2)} submitted!'
              : 'Hourly rate proposal of \$${widget.suggestedPrice.toStringAsFixed(2)}/hour submitted!',
        ),
      ),
    );
  }
}
