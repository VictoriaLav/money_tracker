import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {}

class Loading extends LoginState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends LoginState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  final String error;

  LoginError(this.error);

  @override
  List<Object?> get props => [error];
}