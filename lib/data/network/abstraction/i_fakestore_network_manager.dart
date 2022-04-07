import 'i_network_manager.dart';

abstract class IFakestoreNetworkManager extends INetworkManager {
  IFakestoreNetworkManager() : super('https://fakestoreapi.com');
}
