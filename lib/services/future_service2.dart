import 'package:progettodart/mixins/do_something-mixin.dart';

class FutureServiceSeconds with DoSomethingMixin {
  Future<int> doSomeThing(int duration) async {
    return doSomeThingWithType(duration, 1);
  }
}
