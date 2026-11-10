part of 'more_cubit.dart';

@immutable
sealed class MoreState {}

final class MoreInitial extends MoreState {}

///While fetching user's data.
final class UserDataLoadingState extends MoreState {
  
}
