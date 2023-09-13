part of 'welcome_blocs.dart';

@immutable
abstract class WelcomeState {}

class PageState {
  int pageCount;
  PageState({this.pageCount = 0});
}
