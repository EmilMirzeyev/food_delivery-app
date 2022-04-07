import '/data/local/abstraction/i_local_auth_repository.dart';
import '/data/local/abstraction/i_app_settings_repository.dart';
import '/data/local/abstraction/i_token_repository.dart';

abstract class IUnitOfWork {
  abstract ITokenRepository? tokenRepository;
  abstract IAppSettingsRepository appSettingsRepository;
  abstract ILocalAuthRepository localAuthRepository;
}
