// Stores the pin numbers for each of the LEDs
int pins[] = {5, 6, 9};

// Stores the current value of each LED pin
int pinValues[] = {125, 125, 125};

// Stores the value we're transitioning to for each LED
int pinTargetValues[] = {125, 125, 125};

int stepCount = 0;

void setup() {
  // Set up each pin as an output device
  for (int i = 0; i < 3; i++) {
    pinMode(pins[i], OUTPUT);
    analogWrite(pins[i], pinValues[i]);
  }
  
  // if analog input pin 0 is unconnected, random analog
  // noise will cause the call to randomSeed() to generate
  // different seed numbers each time the sketch runs.
  // randomSeed() will then shuffle the random function.
  randomSeed(analogRead(0));
}

void loop() {
  int i = stepCount;
  
  // If we've reached our target value, pick a new one
  if (pinValues[i] == pinTargetValues[i]) pinTargetValues[i] = random(0, 255);
    
  // Move one step closer to the target value
  if (pinTargetValues[i] < pinValues[i]) pinValues[i]--;
  else pinValues[i]++;
    
  // Change the LED to reflect the new target value
  analogWrite(pins[i], pinValues[i]);
  
  stepCount++;
  if (stepCount == 3) stepCount = 0;
  
  // Run the animation at a reasonable rate
  delay(6);
}
