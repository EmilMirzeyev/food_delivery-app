abstract class ILocalAuthRepository {
  Future<bool> save({required List<int>? pincode});
  Future<List<int>?> get();
  Future<bool> remove();
  Future<bool> update({required List<int>? pincode});
}
