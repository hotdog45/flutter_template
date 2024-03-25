
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class HttpErrorEvent {
  final int code;

  final String message;

  HttpErrorEvent(this.code, this.message);
}





