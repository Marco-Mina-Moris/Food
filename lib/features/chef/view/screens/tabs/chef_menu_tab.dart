import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';
import 'package:food/features/chef/view/widgets/chef_menu_grid_item.dart';

class ChefMenuTab extends StatelessWidget {
  const ChefMenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChefCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Menu Management",
          style: TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<ChefCubit, ChefState>(
        builder: (context, state) {
          final meals = cubit.meals;

          if (meals.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu_rounded,
                    size: 80,
                    color: AppColors.lavenderGray,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Your menu is empty",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Tap the + button to add your first dish!",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.lightSteelBlue,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.72,
            ),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return ChefMenuGridItem(meal: meal);
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 84),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addMenu, arguments: cubit);
          },
          backgroundColor: AppColors.orange,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
