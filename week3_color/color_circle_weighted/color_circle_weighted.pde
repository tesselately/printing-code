float SEGMENT_SIZE = 2*PI / 12;

float segment(float start, float size, float hue, float saturation, float brightness) {
    fill(color(hue, saturation, brightness));
    arc(0, 0, 500, 500, start - size, start);
    return start - size; 
}

void setup() {
    size(600, 600);
    smooth();
    noStroke();
    noLoop();

    colorMode(HSB, TWO_PI, 100, 100);
}

void draw() {
    background(color(0, 0, 100));
    translate(300, 300);

    float angle = random(360);

    float[][] hues = {
        { 0, 6 },
        { 1*SEGMENT_SIZE, 8 },
        { 2*SEGMENT_SIZE, 9 },
        { 4*SEGMENT_SIZE, 6 },
        { 7*SEGMENT_SIZE, 4 },
        { 9.5*SEGMENT_SIZE, 3 } 
    };

    float totalWeight = 0;
    for (int i = 0; i < hues.length; i++) {
        totalWeight += (1 / hues[i][1]);
    }

    for (int i = 0; i < hues.length; i++) {
        float hue = hues[i][0];
        float extensionValue = hues[i][1];
        float weight = (1 / extensionValue) / totalWeight; 

        float size = TWO_PI * weight;

        angle = segment(angle, size, hue, 100, 80);
    }

    fill(color(0, 0, 100));
    ellipse(0, 0, 300, 300);
}

void mouseClicked() {
    redraw();
}

