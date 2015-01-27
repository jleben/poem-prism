color bkg_color;
color second_color;
color minute_color;
color hour_color;
String [] array_of_words;

color random_color()
{
  return color(random(255),random(255), random(255));
}

color random_hue_color(int saturation, int brightness, int range)
{
  return color(random(range),saturation,brightness);
}

color shift_hue(color c, int amount, int range)
{
  return color((hue(c) + amount) % range, 100, 100);
}

void draw_word_spiral()
{
  int fast_word_scan = (millis() / 50) % array_of_words.length;
  int slow_word_scan = millis() / 1000 % array_of_words.length;
  int start_hue = (millis() / 100);

  for (int w = 0; w < array_of_words.length; ++w)
  {
      float intensity =
          max(0, 1 - abs(w - fast_word_scan) / 5.0) / 2 +
          max(0, 5 - abs(w - slow_word_scan)) / 5.0;
      intensity = max(intensity, 0.1);
      float angle = sqrt(w + 1) / 2.2 * 2 * PI;
      float radius = sqrt(w) * 300 / 8 + 30;
      float x = sin(angle) * radius;
      float y = -cos(angle) * radius;
      color word_color = color((start_hue + w / 3) % 100, 80, 80);

      String word = array_of_words[w];
      fill(word_color, intensity * 100);
      text(word, width/2.0 + x, width/2.0 + y);
  }
}

void setup()
{
  colorMode(HSB, 100);
  size(700,700);
  textSize(15);

  String text = "Never and never, my girl riding far and near " +
  "In the land of the hearthstone tales, and spelled asleep, " +
  "Fear or believe that the wolf in a sheepwhite hood " +
  "Loping and bleating roughly and blithely shall leap, " +
  "My dear, my dear, " +
  "Out of a lair in the flocked leaves in the dew dipped year " +
  "To eat your heart in the house in the rosy wood.";

  array_of_words = text.split("\\s");
}

void draw()
{
  background(bkg_color);

  draw_word_spiral();
}

