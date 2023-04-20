abstract class StoreInfoState {
  const StoreInfoState();
}

class StoreInfoInit extends StoreInfoState {}

class StoreInfoError extends StoreInfoState {
  String msg;
  StoreInfoError(this.msg);
}

class StoreInfoSucces extends StoreInfoState {}
