abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String msg;
  const HomeLoaded(this.msg);
}

class HomeError extends HomeState {
  final String msg;

  const HomeError(this.msg);
}
