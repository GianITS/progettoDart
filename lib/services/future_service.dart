import 'package:progettodart/mixins/do_something-mixin.dart';

class FutureService with DoSomethingMixin {
  Future<int> doSomeThing(int duration) async {
    return doSomeThingWithType(duration, 2);
  }
}
