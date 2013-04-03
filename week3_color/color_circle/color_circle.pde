float SEGMENT_SIZE = 2*PI / 12;

void segment(float radians, float saturation, float brightness) {
    fill(color(radians, saturation, brightness));
    arc(0, 0, 500, 500, radians + radians(1), radians + SEGMENT_SIZE - radians(1)); 
}

void setup() {
    size(600, 600);
    smooth();
    noStroke();

    background(255);
    colorMode(HSB, 2*PI, 100, 100);

    translate(300, 300);

    for (int i = 0; i < 12; i++) {
        segment(i * SEGMENT_SIZE, 100, 100);
    }

    fill(color(0, 0, 100));
    ellipse(0, 0, 300, 300);
}

