## INTRA-HOUR SOLAR IRRADIANCE ESTIMATION USING INFRARED SKY IMAGES AND MOBILENETV2-BASED CNN REGRESSION

## Code Organization
All codes are written in python.

* `main.ipynb` Trains the model. Consists of Data Loaders, Model, Training and Evaluation cells. Uses the scrips stored in the `.scripts/` folder

* `prepareDs.ipynb` Prepares the dataset in a trainbale format.
### .scripts/
* `saveResults.py` Calculates loss, Creates results folder for particular training based on hyperparameters and time, Saves the results and diagrams.

* `imagetoTensor.py` converts image to pytorch tensor for testing purposes.

* `saveThermalImage.py` converts grayscale infrared image to thermal image using colormap. Used for the menuscript.

### .results/
The output best_model, results and diagrams are stored here.





