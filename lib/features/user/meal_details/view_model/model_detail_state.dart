part of 'model_detail_cubit.dart';

@immutable
sealed class ModelDetailState {}

final class ModelDetailInitial extends ModelDetailState {}

final class ModelDetailLoading extends ModelDetailState {}

final class ModelDetailSuccess extends ModelDetailState {}

final class ModelDetailError extends ModelDetailState {
  final String messageError;

  ModelDetailError(this.messageError);
}
