<p align="left"> <img src="https://komarev.com/ghpvc/?username=bilguunint&label=Profile%20views&color=0e75b6&style=flat" alt="bilguunint" /> </p>

## Screenshots

<p float="left">
  <img src="https://i.ibb.co/XSZV3Sr/Screenshot-2024-01-08-150040.png">
</p>

## Usage

https://www.themoviedb.org/ Register and Login get API Key from Profile > Settings > API

lib/repositories/movie_repository.dart -> You can set your API key here.

```ruby
class MovieRepository {
  final String apiKey = "<<Here is your API key>>";
  static String mainUrl = "https://api.themoviedb.org/3";
}
```

- All you need is here:

		git clone https://github.com/bilguunint/Flutter-Movie-App.git
		
		cd Flutter-Movie-App
		
		flutter run

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
