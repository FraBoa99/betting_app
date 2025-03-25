import 'package:betting_app/core/network/api_service.dart';
import 'package:betting_app/core/repository/auth_repository.dart';
import 'package:betting_app/core/repository/odds_repository.dart';
import 'package:betting_app/core/repository/user_repository.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  getIt.registerLazySingleton<OddsRepository>(
      () => OddsRepository(apiClient: getIt<ApiService>()));

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory<UserCubit>(() => UserCubit(
      userRepository: getIt<UserRepository>(), authCubit: getIt<AuthCubit>()));
  getIt.registerFactory<NavigationCubit>(
      () => NavigationCubit(getIt<BottomNavCubit>()));
}
