import '/app/localization/abstraction/i_localizator.dart';
import '/app/localization/concrency/app_localizator.dart';
import '/app/routing/abstraction/i_router.dart';
import '/app/routing/concrency/router.dart';
import '/data/network/abstraction/i_products_network_manager.dart';
import '/data/unit-of-work/abstraction/i_unit_of_work.dart';
import '/data/unit-of-work/concrency/shared_preferences/shared_preferences_unit_of_work.dart';
import '/ui/utils/constraints/key_constraints.dart';

class AppDiContainer {
  late IRouter appRouter;
  late IProductsNetworkManager productsNetworkManager;
  late ILocalizator _appLocalizator;
  ILocalizator get appLocalizator => _appLocalizator;

  late IUnitOfWork unitOfWork;

  static AppDiContainer get instance => _instance ??= AppDiContainer._();
  static AppDiContainer? _instance;
  AppDiContainer._() {
    appRouter = Router();
    // productsNetworkManager = FakestoreProductsNetworkManager();
    _appLocalizator = AppLocalizator();

    unitOfWork = SharedPreferencesUnitOfWork();
  }
}

ILocalizator get localizator => AppDiContainer.instance.appLocalizator;
Map<WordMapKeys, String> get keys => KeyConstraints.instance.wordKeys;
