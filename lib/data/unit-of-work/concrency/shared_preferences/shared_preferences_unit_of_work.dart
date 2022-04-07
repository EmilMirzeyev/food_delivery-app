
import '/data/local/abstraction/i_local_auth_repository.dart';
import '/data/local/concrency/shared_preferences_repositories/shared_preferences_local_auth_repository.dart';
import '/data/local/abstraction/i_app_settings_repository.dart';
import '/data/local/concrency/shared_preferences_repositories/shared_preferences_app_settings_repository.dart';
import '/data/local/abstraction/i_token_repository.dart';
import '/data/local/concrency/shared_preferences_repositories/shared_preferences_token_repository.dart';
import '/data/unit-of-work/abstraction/i_unit_of_work.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUnitOfWork extends IUnitOfWork {
  @override
  ITokenRepository? tokenRepository =
      SharedPreferencesTokenRepository(SharedPreferences.getInstance());

  @override
  IAppSettingsRepository appSettingsRepository =
      SharedPreferencesAppSettingsRepository(SharedPreferences.getInstance());


  @override
  ILocalAuthRepository localAuthRepository =
      SharedPreferencesLocalAuthRepository(SharedPreferences.getInstance());

}
