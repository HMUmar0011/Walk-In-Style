abstract class BottomNavigationState {
 BottomNavigationState();
}

final class BottomNavigationInitial extends BottomNavigationState {
  int index;
  BottomNavigationInitial({required this.index});
}