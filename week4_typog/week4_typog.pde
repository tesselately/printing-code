void setup() {
    size(800, 400);
    //noLoop();
    noFill();
}

final float TAU = TWO_PI;
final float HALF_TAU = PI;
final float QUARTER_TAU = HALF_PI;
final float EIGHTH_TAU = QUARTER_PI;

float[][] letters = {
    /* a */ {1, 2, 1, 1, 1, -1, 0, -1, -1, 0, 0, 1, 1, 0.5, 2, 0},
    /* e */ {-2, 0, -1, 0, 1, 0, 0, -1, -1, 0, 0, 1, 1*sin(EIGHTH_TAU), 1*cos(EIGHTH_TAU), 1, 0},
    /* l */ {0, 2, 0, 1, 0, -2, 0, -3},
    /* n */ {-1, 2, -1, 1, -1, -1, 1, -1, 1, 1, 1, 2},
    /* r */ {-1, 2, -1, 1, -1, -1, 1, -1, 2, -1},
    /* s */ {2, -1, 1, -1, 0, -1, -1, -0.5, 0, 0, 1, 0.5, 0, 1, -1, 1, -2, 1}
};

void draw() {
    background(255);

    // "snarler"
    // "aelnrs"
    float[][] snarler = {letters[5], letters[3], letters[0],
        letters[4], letters[2], letters[1], letters[4]};

    float kern = 86.0 / 4.0;

    translate(400, 200);
    translate(-(3 * (86 + kern)), 0);

    float perturb = mouseX < 20 ? 0.0
                  : (mouseX - 20) / 2400.0;

    for (int i = 0; i < snarler.length; i++) {
        float[] letter = snarler[i];
        pushMatrix();
        scale(86/2);
        strokeWeight(3.0 / 86.0);
        beginShape();
        for (int j = 0; j < letter.length; j += 2) {
            curveVertex(letter[j] + (random(-1, 1) * perturb),
                letter[j+1] + (random(-1, 1) * perturb));
        }
        endShape();
        popMatrix();
        translate(86 + kern, 0);
    }
}

