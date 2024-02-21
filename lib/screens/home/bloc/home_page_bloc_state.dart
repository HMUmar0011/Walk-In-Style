// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class HomePageBlocState {
  
}
class HomePageBlocInitialState extends HomePageBlocState {
  
}
class HomePageRotationState extends HomePageBlocState {
  bool isDrawerOpen;
  double xOffset;
  double yOffset;
  HomePageRotationState({
    required this.isDrawerOpen,
    required this.xOffset,
    required this.yOffset,
  });
}
