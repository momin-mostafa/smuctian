class BusTrackerRepo{
  static BusTrackerRepo? instance;

  factory BusTrackerRepo(){
    instance ??= BusTrackerRepo._();
    return instance!;
  }

  BusTrackerRepo._();
  
}