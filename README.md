<p align="left"> <img src="https://komarev.com/ghpvc/?username=bilguunint&label=Profile%20views&color=0e75b6&style=flat" alt="bilguunint" /> </p>

## Screenshots

<p float="left">
  <img src="https://firebasestorage.googleapis.com/v0/b/lookbookmn.appspot.com/o/movie_screen1.png?alt=media&token=28011e97-1b7f-4528-8ff5-e5fe7abc77f3" width="350">
   <img src="https://firebasestorage.googleapis.com/v0/b/lookbookmn.appspot.com/o/movie_screen2.png?alt=media&token=58d94dc2-84f0-4df9-b70d-c8cbe25f3b7b" width="350">
</p>

## Video

[![Flutter Movie App v2 - BLoC, RxDart, JSON API](https://i.ytimg.com/vi/ADN9V03ePNw/sddefault.jpg)](https://www.youtube.com/watch?v=ADN9V03ePNw "Flutter Movie App v2 - BLoC, RxDart, JSON API")

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
