import 'dart:svg';

abstract class State {
  void handler(Stateful context);
  String toString();
}

class StatusOn implements State {
  handler(Stateful context) {
    print("  Handler of StatusOn is being called!");
    context.state = StatusOff();
  }

  @override
  String toString() {
    return "on";
  }
}

class StatusOff implements State {
  handler(Stateful context) {
    print("  Handler of StatusOff is being called!");
    context.state = StatusOn();
  }

  @override
  String toString() {
    return "off";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void touch() {
    print("  Touching the Stateful...");
    _state.handler(this);
  }
}

void main() {
  var lightSwitch = Stateful(StatusOff());
  print("The light switch is ${lightSwitch.state}.");
  print("Toggling the light switch...");
  lightSwitch.touch();
  print("The light switch is ${lightSwitch.state}.");
}

abstract class Behavior {
  void update();
}

class Enemy extends Behavior {
  EnemyState _state;
  double velocity = 0;
  Point position;

  EnemyState get state => _state;
  set state(EnemyState newState) => _state = _state;

  @override
  void update() {
    _state.handler(this);
  }
}

abstract class EnemyState {
  void start(Enemy context);
  void handler(Enemy context);
  void stop(Enemy context);

  String toString();
}

class Run implements EnemyState {
  @override
  void start(Enemy context) {
    context.velocity = 20;
  }

  @override
  void handler(Enemy context) {
    context.position.x += context.velocity;
    context.position.y += context.velocity;
  }

  @override
  void stop(Enemy context) {
    context.velocity = 0;
  }
}

class Stope implements EnemyState {
  @override
  void start(Enemy context) {
    context.velocity = 0;
  }

  @override
  void handler(Enemy context) {
    // Animation parado
  }

  @override
  void stop(Enemy context) {
    
  }
}
