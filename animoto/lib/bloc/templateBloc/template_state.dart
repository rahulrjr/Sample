part of 'template_bloc.dart';

abstract class TemplateState extends Equatable {
  const TemplateState();

  @override
  List<Object> get props => [];
}

class TemplateInitial extends TemplateState {}

class TemplatesLoadingState extends TemplateState {}

class TemplatesLoadedState extends TemplateState {

  final List<TemplateModel> list;

  TemplatesLoadedState(this.list);
}

class ErrorState extends TemplateState {}
