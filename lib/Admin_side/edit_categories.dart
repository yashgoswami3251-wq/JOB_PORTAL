
import 'package:flutter/material.dart';
import '../references/reference.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({super.key});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController categoryController =
  TextEditingController(text: 'IT & Software');

  final TextEditingController jobCountController =
  TextEditingController(text: '234');

  @override
  void dispose() {
    categoryController.dispose();
    jobCountController.dispose();
    super.dispose();
  }

  String? _validateCategory(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter category name';
    }

    if (value.trim().length < 2) {
      return 'Category name must contain at least 2 characters';
    }

    return null;
  }

  String? _validateJobCount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter job count';
    }

    final count = int.tryParse(value.trim());

    if (count == null) {
      return 'Please enter a valid whole number';
    }

    if (count < 0) {
      return 'Job count cannot be negative';
    }

    return null;
  }

  void _updateCategory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Category updated successfully!'),
        backgroundColor: Color(0xFF367588),
      ),
    );

    Navigator.pop(context, {
      'categoryName': categoryController.text.trim(),
      'jobCount': int.parse(jobCountController.text.trim()),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Edit Category',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontweight,
            color: navyColor,
          ),
        ),
        iconTheme: IconThemeData(color: navyColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Category Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: categoryController,
                validator: _validateCategory,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'IT & Software',
                  prefixIcon: Icon(
                    Icons.category_outlined,
                    color: greyColor,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: blueColor),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Job Count',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: jobCountController,
                validator: _validateJobCount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '234',
                  prefixIcon: Icon(
                    Icons.work_outline,
                    color: greyColor,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: blueColor),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _updateCategory,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Update Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: borderColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
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
}
