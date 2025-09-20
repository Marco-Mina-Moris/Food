import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/app_apis.dart';
import '../model/meal_detail_response.dart';

part 'model_detail_state.dart';

class ModelDetailCubit extends Cubit<ModelDetailState> {
  ModelDetailCubit() : super(ModelDetailInitial());

  MealDetail? modelDetail;

  Future<void> getModelDetail(String categoryName) async {
    emit(ModelDetailLoading());
    try {
      final response = await HomeApi.getMealDetails(categoryName);
      modelDetail = response.meals?.first;
      emit(ModelDetailSuccess());
    } catch (e) {
      emit(ModelDetailError("Something went wrong: $e"));
    }
  }
}
