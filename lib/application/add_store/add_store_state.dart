abstract class AddStoreState {
  const AddStoreState();
}

class AddStoreInitial extends AddStoreState {}

class AddStoreLoading extends AddStoreState {}

class AddStoreSucces extends AddStoreState {
  String msg;
  AddStoreSucces(this.msg);
}
