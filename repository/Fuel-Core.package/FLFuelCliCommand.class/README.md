This command will load the <fuelFile> and materialize/install it's contents. If no argument is specified the image exits.

Example:

- Load a fuel file and save and quit the image with the contents:
pharo Pharo.image --save path/to/foo.fuel

- Load the contents of foo.fuel and save the image, but continue running:
pharo Pharo.image --save --keepAlive path/to/foo.fuel

- Load the contents of foo.fuel and continue running without saving:
pharo Pharo.image --keepAlive path/to/foo.fuel