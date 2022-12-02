import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/costs_state.dart';
import '../../repositories/costs_repository.dart';
import '../events/costs_event.dart';

class CostsBloc extends Bloc<CostsEvent, CostsState> {
  final CostsRepository costsRepository;

  CostsBloc({required this.costsRepository})
      : super(CostsState(
            date: DateTime.now(),
            categories: const [],
            costs: const [],
            isLoading: true)) {
    on<SetDateRequested>((event, emit) async {
      loadingState();
      await costsRepository.setDate(event.date);
      await costsRepository.requestAllCategories();
      await costsRepository.requestAllCosts();
      loadData();
    });
    on<UpdateDataRequested>((event, emit) async {
      await costsRepository.requestAllCategories();
      await costsRepository.requestAllCosts();
      loadData();
    });
    on<AddCategoryRequested>((event, emit) async {
      await costsRepository.addCategory(event.name, event.color);
      await costsRepository.requestAllCategories();
      await costsRepository.requestAllCosts();
      loadData();
    });
    on<AddCostRequested>((event, emit) async {
      await costsRepository.addCost(event.sum, event.date, event.category);
      await costsRepository.requestAllCategories();
      await costsRepository.requestAllCosts();
      loadData();
    });
    on<FlagIsDeleteCategoryRequested>((event, emit) async {
      await costsRepository.flagIsDeleteCategory(event.category);
      await costsRepository.requestAllCategories();
      loadData();
    });
    on<FlagIsDeleteCostRequested>((event, emit) async {
      await costsRepository.flagIsDeleteCost(event.cost);
      await costsRepository.requestAllCosts();
      loadData();
    });
    on<DeleteCategoryRequested>((event, emit) async {
      await costsRepository.deleteCategory(event.category);
      await costsRepository.requestAllCategories();
      await costsRepository.requestAllCosts();
      loadData();
    });
    on<DeleteCostRequested>((event, emit) async {
      await costsRepository.deleteCost(event.cost);
      await costsRepository.requestAllCosts();
      loadData();
    });
  }

  void loadingState() async {
    final date = await costsRepository.loadDate();
    final categories = await costsRepository.loadCategories();
    final costs = await costsRepository.loadCosts();

    emit(CostsState(
        date: date, categories: categories, costs: costs, isLoading: true));
  }

  void loadData() async {
    final date = await costsRepository.loadDate();
    final categories = await costsRepository.loadCategories();
    final costs = await costsRepository.loadCosts();
    emit(CostsState(
        date: date, categories: categories, costs: costs, isLoading: false));
  }
}
