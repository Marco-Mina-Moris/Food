import 'package:bloc/bloc.dart';
import 'package:food/core/constants/app_apis.dart';
import 'package:food/features/home/model/response/category2_response.dart';
import 'package:meta/meta.dart';

import '../model/response/restaurants_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Categories> categories = [];
  List<RestaurantMenuResponse> restaurant = [];

  Future<void> getCategories() async {
    //Loading
    emit(HomeLoading());
    try {
      //Success
      final response =
          await HomeApi.getCategories2(); // ده بيرجع CategoryResponse2
      categories = response.categories ?? [];
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeError("Something went wrong"));
    }
  }
}
