import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ShopCartEvent {

  String str;

  ShopCartEvent(this.str);

}

class ShopCartItemEvent {
  String str;
  ShopCartItemEvent(this.str);
}

class ShopCartdisplayEvent{
  String str;
  ShopCartdisplayEvent(this.str);
}