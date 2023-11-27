/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/profile_model.dart';

/* 
 * ProfileComponentState is the base class for state for ProfileComponentBloc
 */
abstract class ProfileComponentState extends Equatable {
  const ProfileComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * ProfileComponentUninitialized is the uninitialized state of the ProfileComponentBloc 
 */
class ProfileComponentUninitialized extends ProfileComponentState {}

/* 
 * ProfileComponentError is the error state of the ProfileComponentBloc 
 */
class ProfileComponentError extends ProfileComponentState {
  final String? message;
  ProfileComponentError({this.message});
}

/* 
 * ProfileComponentPermissionDenied is to indicate permission denied state of the ProfileComponentBloc 
 */
class ProfileComponentPermissionDenied extends ProfileComponentState {
  ProfileComponentPermissionDenied();
}

/* 
 * ProfileComponentLoaded is used to set the state of the ProfileComponentBloc to the loaded state
 */
class ProfileComponentLoaded extends ProfileComponentState {
  final ProfileModel value;

  /* 
   * construct ProfileComponentLoaded
   */
  const ProfileComponentLoaded({required this.value});

  /* 
   * copy method
   */
  ProfileComponentLoaded copyWith({ProfileModel? copyThis}) {
    return ProfileComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ProfileComponentLoaded { value: $value }';
}
