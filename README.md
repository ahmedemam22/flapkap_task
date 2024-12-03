# Flutter Orders Metrics App

This Flutter app is designed to display key metrics about user orders from an e-commerce shop, as well as visualize order trends over time using a graph.

## Installation

1. Clone this repository to your local machine:

```bash
git clone https://github.com/ahmed_emam22/flapkap_task.git
```
2. Navigate to the project directory:

```bash
cd flapkap_task
```
3. Install the required dependencies:

```bash
flutter pub get
```

## Usage
1. Run the app on an emulator or a connected device:

```bash
flutter run
```
* On the first screen, you will see the numeric metrics for your orders, including:
  * Total count of orders: Displays the total number of orders placed.
  * Average price: Shows the average price of all the orders.
  * Number of returns: Displays the total number of returned orders.

* On the second screen, you will see a graph plotting the number of orders over time.

## Data Source
* The app reads order data from a provided JSON file containing details about the orders. Make sure the data is formatted correctly before loading it into the app.

## Dependencies
* fl_chart: For plotting the graph.
* flutter_bloc: For managing state across screens.
* flutter_screenutil : for responsive
* freezed : for code generator 

## Contributing

* Fork the repository
* Create a new branch for your feature
* Make your changes
* Create a pull request to the main branch


## License

[MIT](https://choosealicense.com/licenses/mit/)
