// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}
// Initial state
class GlobalInitial extends GlobalState {}
//state for changing bottom navigation 
class ChangeBottomNavState extends GlobalState {}


