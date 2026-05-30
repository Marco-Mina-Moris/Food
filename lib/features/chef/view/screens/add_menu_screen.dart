import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/model/chef_models.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';

class AddMenuScreen extends StatefulWidget {
  const AddMenuScreen({super.key});

  @override
  State<AddMenuScreen> createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  String _selectedCategory = "Burgers";
  final List<String> _categories = ["Burgers", "Pizza", "Desserts", "Drinks"];

  // Pre-loaded food images to automatically link based on category
  final Map<String, String> _categoryImages = {
    "Burgers": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80",
    "Pizza": "https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=500&q=80",
    "Desserts": "https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?auto=format&fit=crop&w=500&q=80",
    "Drinks": "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=500&q=80",
  };

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _saveDish() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final price = double.tryParse(_priceController.text.trim()) ?? 0.0;
      final desc = _descController.text.trim();
      final image = _categoryImages[_selectedCategory] ?? _categoryImages["Burgers"]!;

      final newMeal = ChefMeal(
        id: Random().nextInt(10000).toString(),
        name: name,
        price: price,
        category: _selectedCategory,
        description: desc,
        image: image,
        isAvailable: true,
      );

      // Trigger the Cubit action
      context.read<ChefCubit>().addMeal(newMeal);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("'$name' added to your menu!"),
          backgroundColor: AppColors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultImage = _categoryImages[_selectedCategory]!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.darkBlue, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Add New Dish",
          style: TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mock Image Upload Area with Category Indicator
                Text(
                  "Dish Cover Image",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightgray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.lavenderGray, width: 1.5, style: BorderStyle.solid),
                    image: DecorationImage(
                      image: NetworkImage(defaultImage),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.photo_library_rounded, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            "Auto Picked for $_selectedCategory",
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Dish Name Input
                _buildLabel("Dish Name"),
                TextFormField(
                  controller: _nameController,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return "Please enter the dish name";
                    }
                    return null;
                  },
                  decoration: _buildInputDecoration("e.g. Classic Margherita Pizza"),
                ),
                const SizedBox(height: 18),

                // Price Input
                _buildLabel("Price (\$)"),
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return "Please enter the price";
                    }
                    final price = double.tryParse(val.trim());
                    if (price == null || price <= 0) {
                      return "Please enter a valid positive price";
                    }
                    return null;
                  },
                  decoration: _buildInputDecoration("e.g. 9.99"),
                ),
                const SizedBox(height: 18),

                // Category Selection
                _buildLabel("Food Category"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightgray,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.iceGray, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCategory,
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.darkGray),
                      style: TextStyle(color: AppColors.darkBlue, fontSize: 14, fontWeight: FontWeight.w500),
                      items: _categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedCategory = val;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Description Input
                _buildLabel("Description"),
                TextFormField(
                  controller: _descController,
                  maxLines: 4,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return "Please enter a description";
                    }
                    if (val.trim().length < 8) {
                      return "Description should be at least 8 characters";
                    }
                    return null;
                  },
                  decoration: _buildInputDecoration("Tell us about the ingredients, calories, prep details..."),
                ),
                const SizedBox(height: 32),

                // Save Action Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveDish,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "ADD TO MENU",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: AppColors.darkBlue,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.lightSteelBlue, fontSize: 13),
      fillColor: AppColors.lightgray,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.orange, width: 1.5),
      ),
    );
  }
}
