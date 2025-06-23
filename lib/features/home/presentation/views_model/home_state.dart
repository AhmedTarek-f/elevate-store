sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class FetchProductsLoadingState extends HomeState {}

final class FetchProductsSuccessState extends HomeState {}

final class FetchProductsFailureState extends HomeState {
  const FetchProductsFailureState({required this.errorMessage});
  final String errorMessage;
}
