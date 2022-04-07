abstract class IBaseCommand {
  bool canExecute(Map? params);
  void execute(Map? params);
  void doExecute(Map? params) {
    if (canExecute(params)) execute(params);
  }
}
