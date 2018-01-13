![](https://pbs.twimg.com/media/CEKwK7HUIAAxuF1.png)

# foursquare-kit-ios

Foursquare Kit is a easy way to use the Foursquare API in your apps. You can search for venues, get details and photos.
It's a very light framework without any dependencies, extensible, and tested. It doesn't cover all the APIs yet. If you have a specific need, please be free to open an issue, or a pull request.

## Installation

To add Foursquare Kit to your app, simply add **FoursquareKit** to your ```Podfile```.

```
target 'MyApp' do
  use_frameworks!
  pod 'FoursquareKit'
end
```

## Initialize a FoursquareClient instance

You can authentificate to the Foursquare API with **client_id / client_secret** or with a **token**.

```Swift
import FoursquareKit

class RestaurantsViewController: UIViewController {
  override viewDidLoad() {
    super.viewDidLoad()
    let auth = Authentification(clientId: "123", clientSecret: "456")
    let client = FoursquareClient(authentification: auth)
  }
}
```

## Performing API requests

Start by creating a reference to the **FoursquareClient** instance that you will use to make your API calls.

Searching for venues (documentation https://developer.foursquare.com/docs/api/venues/search):
```Swift
let parameters = ["ll" : "44.3,37.2"]
client.search.venues(parameters: parameters).response { result in
  switch result {
    case .success(let data):
      venues = data.response.venues
    case .failure(let error):
      print("error : \(error)")
  }
}
```

Searching for trending venues (documentation https://developer.foursquare.com/docs/api/venues/trending):
```Swift
let parameters = ["ll" : "44.3,37.2"]
client.search.trending(parameters: parameters).response { result in
  switch result {
    case .success(let data):
      venues = data.response.venues
    case .failure(let error):
      print("error : \(error)")
  }
}
```

Get details for a venue (documentation https://developer.foursquare.com/docs/api/venues/details):
```Swift
client.venue.details(id: "123").response { result in
  switch result {
    case .success(let data):
      venue = data.response.venue
    case .failure(let error):
      print("error : \(error)")
  }
}
```

Get photos for a venue (documentation https://developer.foursquare.com/docs/api/venues/photos):
```Swift
client.venue.photos(id: "123").response { result in
  switch result {
    case .success(let data):
      photos = data.response.photos.items
    case .failure(let error):
      print("error : \(error)")
  }
}
```

## Cancelling a request

All the API calls will return a ```Request<T: Codable>``` object, simply call the ```cancel``` function to cancel the network call.
```Swift
let request = client.venue.photos(id: "123").response { result in
  //...
}
request.cancel()
```
