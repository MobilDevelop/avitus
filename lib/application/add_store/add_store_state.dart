abstract class AddStoreState {
  const AddStoreState();
}

class AddStoreInitial extends AddStoreState {}

class AddStoreEmpty extends AddStoreState {
  String msg;

  AddStoreEmpty({required this.msg});
}

class AddStoreSucces extends AddStoreState {}
