// Stores the pin numbers for each of the LEDs
int pins[] = {5, 6, 9};

// Stores the current value of each LED pin
int pinValues[] = {0, 0, 0};

// Stores the value we're transitioning to for each LED
int pinTargetValues[] = {0, 0, 0};

void setup() {
  // Set up each pin as an output device
  for (int i = 0; i < 3; i++) {
    pinMode(pins[i], OUTPUT);
  }
}

void loop() {
  // Operate on each of the pins
  for (int i = 0; i < 3; i++) {
    // If we've reached our target value, pick a new one
    if (pinValues[i] == pinTargetValues[i]) pinTargetValues[i] = random(0, 255);
    
    // Move one step closer to the target value
    if (pinTargetValues[i] < pinValues[i]) pinValues[i]--;
    else pinValues[i]++;
    
    // Change the LED to reflect the new target value
    analogWrite(pins[i], pinValues[i]);
  }
  
  // Run the animation at a reasonable rate
  delay(25);
}
