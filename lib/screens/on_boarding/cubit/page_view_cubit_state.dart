 abstract class PageViewState {
  int selectedIndex=0;
  PageViewState({required this.selectedIndex});
}
class SelectedPageViewState extends PageViewState {

SelectedPageViewState({required super.selectedIndex});
}