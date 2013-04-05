void square(color c, float x, float y, float radius) {
    pushMatrix();
    translate(x, y);

    fill(c);
    rect(-radius, -radius, radius*2, radius*2);     

    popMatrix();
}

void setup() {
    size(600, 600);
    smooth();
    noStroke();
    noLoop();

    colorMode(HSB, TWO_PI, 100, 100);
}

void draw() {
    color bg = color(random(TWO_PI), random(100), random(100));
    background(bg);

    // These functions use "the current color mode" to
    // scale the returned values... which means our HSB
    // values. That's kinda dumb.
    float red = red(bg) / TWO_PI;
    float green = green(bg) / 100;
    float blue = blue(bg) / 100;

    // This is the formula from Panic's iTunes-11-alike
    // color experiment.
    // Post: http://www.panic.com/blog/2012/12/itunes-11-and-colors/
    // Code: https://github.com/panicinc/ColorArt/blob/master/ColorArt/SLColorArt.m#L296
    float brightness = sqrt(0.2126 * red + 0.7152 * green + 0.0722 * blue);
    println("Color (" + red + "," + green + "," + blue + ") has brightness " + brightness);

    boolean darkBackground = brightness < 0.5;
    boolean lightBox = darkBackground;

    square(color(0, 0, lightBox ? 100 : 0), 300, 300, 100);
}

void mouseClicked() {
    redraw();
}

