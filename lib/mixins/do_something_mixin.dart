mixin DoSomethingMixin {
  Future<int> doSomeThingWithType(int duration, int type) async {
    Duration d = type == 1
        ? Duration(seconds: duration)
        : Duration(milliseconds: duration);
    return Future.delayed(d, () {
      print("Duration : $duration");
      return duration;
    });
  }
}
