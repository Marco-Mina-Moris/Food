import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/features/app_section/app_section.dart';
import 'package:food/features/favorite/view_model/favorite_cubit.dart';
import 'package:food/features/favorite/view/widgets/favorite_empty_state_widget.dart';
import 'package:food/features/favorite/view/widgets/favorite_item_card_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    // Load favorites immediately
    context.read<FavoriteCubit>().loadFavorites();
    // Add listener for tab changes
    AppSection.activeTabNotifier.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    AppSection.activeTabNotifier.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (AppSection.activeTabNotifier.value == 2) {
      context.read<FavoriteCubit>().loadFavorites();
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
              child: BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {
                  // Custom feedback or side effects if needed
                },
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FavoriteError) {
                    return Center(
                      child: Text(
                        state.messageError,
                        style: GoogleFonts.sen(color: Colors.red),
                      ),
                    );
                  }

                  if (state is FavoriteLoaded) {
                    final favorites = state.favorites;

                    if (favorites.isEmpty) {
                      return const FavoriteEmptyStateWidget();
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final item = favorites[index];
                        final idMeal = item['idMeal'] ?? '';
                        final strMeal = item['strMeal'] ?? '';

                        return FavoriteItemCardWidget(
                          key: ValueKey(idMeal),
                          item: item,
                          index: index,
                          onRefresh: () {
                            context.read<FavoriteCubit>().loadFavorites();
                          },
                          onRemove: () {
                            context.read<FavoriteCubit>().removeFavorite(idMeal);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '$strMeal removed from favorites',
                                  style: GoogleFonts.sen(color: Colors.white),
                                ),
                                backgroundColor: AppColors.orange,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
