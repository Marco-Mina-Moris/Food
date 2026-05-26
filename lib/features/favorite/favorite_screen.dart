import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/storage_helper/favorites_manager.dart';
import 'package:food/features/app_section/app_section.dart';
import 'package:food/features/meal_details/view/screens/meal_details_screen.dart';
import 'package:food/features/meal_details/view_model/model_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    AppSection.activeTabNotifier.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    AppSection.activeTabNotifier.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (AppSection.activeTabNotifier.value == 2) {
      _loadFavorites();
    }
  }

  Future<void> _loadFavorites() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    final list = await FavoritesManager.getFavorites();
    if (!mounted) return;
    setState(() {
      _favorites = list;
      _isLoading = false;
    });
  }

  Future<void> _removeFavorite(String idMeal, String mealName) async {
    final deleted = await FavoritesManager.toggleFavorite(
      idMeal: idMeal,
      strMeal: '',
      strMealThumb: '',
    );
    if (!deleted) {
      setState(() {
        _favorites.removeWhere((item) => item['idMeal'] == idMeal);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '$mealName removed from favorites',
              style: GoogleFonts.sen(color: Colors.white),
            ),
            backgroundColor: AppColors.orange,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== Custom App Bar =====
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.paleBlue,
                    radius: 24,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.veryDarkBlue,
                      onPressed: () {
                        AppSection.activeTabNotifier.value = 0; // Go to Home
                      },
                    ),
                  ),
                  Text(
                    'Favorites',
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.veryDarkBlue,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.paleBlue,
                    radius: 24,
                    child: SvgPicture.asset(
                      Assets.assetsImagesMore,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.veryDarkBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ===== Content Section =====
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _favorites.isEmpty
                      ? _buildEmptyState()
                      : _buildFavoritesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Beautiful glowing favorite circle
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.paleBlue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orange.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 70,
                    color: AppColors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'No Favorites Yet',
                style: GoogleFonts.sen(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.veryDarkBlue,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You don\'t have any favorite food items yet. Explore the menu and select your favorite ones!',
                textAlign: TextAlign.center,
                style: GoogleFonts.sen(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              // Explore button
              MaterialButton(
                onPressed: () {
                  AppSection.activeTabNotifier.value = 0; // Redirect to Home tab
                },
                color: AppColors.orange,
                elevation: 0,
                highlightElevation: 0,
                height: 56,
                minWidth: 200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Explore Menu',
                  style: GoogleFonts.sen(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      itemCount: _favorites.length,
      itemBuilder: (context, index) {
        final item = _favorites[index];
        final idMeal = item['idMeal'] ?? '';
        final strMeal = item['strMeal'] ?? '';
        final strMealThumb = item['strMealThumb'] ?? '';
        final strCategory = item['strCategory'] ?? 'Unknown';
        final strArea = item['strArea'] ?? 'Unknown';

        return FadeInLeft(
          key: ValueKey(idMeal),
          duration: Duration(milliseconds: 300 + (index * 50)),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider<ModelDetailCubit>(
                    create: (context) => ModelDetailCubit()..getModelDetail(idMeal),
                    child: MealDetailsScreen(mealId: idMeal),
                  ),
                ),
              ).then((_) => _loadFavorites()); // Refresh when returning
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: AppColors.gray,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // Food Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      strMealThumb,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: AppColors.paleBlue,
                          child: const Icon(Icons.fastfood, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Item Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          strMeal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.sen(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.veryDarkBlue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$strCategory • $strArea',
                          style: GoogleFonts.sen(
                            fontSize: 12,
                            color: AppColors.darkGray,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: GoogleFonts.sen(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.veryDarkBlue,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.access_time, color: Colors.grey, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              '25 min',
                              style: GoogleFonts.sen(
                                fontSize: 12,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Actions
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Red Heart to Unfavorite
                      GestureDetector(
                        onTap: () => _removeFavorite(idMeal, strMeal),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.paleBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Plus Add button
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
