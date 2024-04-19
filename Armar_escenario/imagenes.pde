class Game {
  PImage FondoImage;
  PImage jugadorImage;
  PImage enemigoImage;
  PImage nubeImage;
  ArrayList<Cloud> clouds;

  int playerX, playerY;
  int enemyX, enemyY;
  int enemySpeed;
  int direction;

  Game() {
    loadImages();
    createClouds();
  }

  void draw() {
    image(FondoImage, 0, 0, width, height);
    drawClouds();
    moveEnemy();
    movePlayer();
  }

  private void loadImages() {
    FondoImage = loadImage("Fondo.jpg");
    jugadorImage = loadImage("jugador.png");
    enemigoImage = loadImage("enemigo.png");
    nubeImage = loadImage("nube.png");
  }

  private void createClouds() {
    clouds = new ArrayList<Cloud>();
    for (int i = 0; i < 25; i++) {
      clouds.add(new Cloud(random(width), random(height), random(100, 150), random(1, 5)));
    }
  }

  private void drawClouds() {
    for (Cloud cloud : clouds) {
      image(nubeImage, cloud.x, cloud.y, cloud.size, cloud.size);
      cloud.x += cloud.speed;
      if (cloud.x > width) {
        cloud.x = 0;
        cloud.y = random(height);
      }
    }
  }

  private void movePlayer() {
    playerX = mouseX;
    playerY = mouseY;
    image(jugadorImage, playerX, playerY, 100, 100);
  }

  private void moveEnemy() {
    image(enemigoImage, enemyX, enemyY, 150, 150);
    enemyX += enemySpeed * direction;
    if (enemyX <= 0 || enemyX >= width - 150) {
      direction *= -1;
    }
  }
}
