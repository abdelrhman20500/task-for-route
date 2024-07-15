abstract class HomeState{}
class InitialHome extends HomeState{}
class LoadingHome extends HomeState{}
class FailureHome extends HomeState{
  String errMessage;
  FailureHome({required this.errMessage});
}
class SuccessHome extends HomeState{}