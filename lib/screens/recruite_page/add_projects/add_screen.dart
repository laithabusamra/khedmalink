import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _skillController = TextEditingController();
  final List<String> _skills = [];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _skillController.dispose();
    super.dispose();
  }

  void _addSkill() {
    if (_skillController.text.isNotEmpty) {
      setState(() {
        _skills.add(_skillController.text);
        _skillController.clear();
      });
    }
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add New Project'),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _submitForm,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Centered Logo
              Center(
                child: Image.asset(
                  'assets/images/Kl.png',
                  height: 80,
                  width: 80,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Project Title
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Project Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Price
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price per hour',
                  prefixText: '\$ ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Required Skills Section
              const Text(
                'Required Skills',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              // Skills Input
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _skillController,
                      decoration: InputDecoration(
                        hintText: 'Add a skill',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _addSkill,
                        ),
                      ),
                      onFieldSubmitted: (value) => _addSkill(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Skills Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _skills.asMap().entries.map((entry) {
                  final index = entry.key;
                  final skill = entry.value;
                  return Chip(
                    label: Text(skill),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () => _removeSkill(index),
                  );
                }).toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttounColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'SAVE PROJECT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newProject = {
        'title': _titleController.text,
        'description': _descriptionController.text,
        'price': '\$${_priceController.text} per hour',
        'skills': List<String>.from(_skills), // Add skills to the project
        'completed': true,
      };

      Get.back(result: newProject);
    }
  }
}
