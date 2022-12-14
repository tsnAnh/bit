part of 'service_locator.dart';

extension ServiceLocatorX on ServiceLocator {
  void configureNetworkModule(AppFlavor flavor) {
    registerSingleton<MediumDataSource>(
        MediumAuthApi(inject<DioClient>().authDio, inject()));
    registerSingleton<MediumRepository>(MediumRepositoryImpl(inject()));
  }
}
