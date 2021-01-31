# DynamicUI 

DynamicUI is a way to fetch and dynamically update user interfaces for SwiftUI.

## Adding DynamicUI to your App

In your Xcode project go to `File -> Swift Packages -> Add Package Dependency` 

And enter
```
https://github.com/brettfazio/DynamicUI
```

As the url. You've now integrated DynamicUI into your app!

## Usage

Here's an example adding it to a simple view called `HomeView`

```
import SwiftUI
import DynamicUI

struct HomeView: View {
  
    @State reference: UIModel = // Fetch from some server or file
    @State model: DynamicVMProtocol = // class that conforms to DynamicVMProtocol

    var body: some View {
        DynamicUI(reference: $reference, model: $model)
    }
}

```

## Contribution

This is still a very WIP package, and very early on in the development. If you'd like to contribute or help with the overall design/architecture of the package feel free to leave an Issue or PR or message me on [LinkedIn](http://linkedin.com/in/brett-fazio/).

## Classses

### DynamicUI

DynamicUI is your entry point to using this package. It is the struct that conforms to `View` that you will place in the body of your view.

### UIModel

UIModel is the `Codable` struct that you will use to decode the json from your server into something that DynamicUI can read.

### DynamicVMProtocol

The Dynamic View Model Protocol is a way to allow for button presses in your application. If you pass a `Button` into your UIModel json DynamicUI calls this `didPress` handler in the DynamicVMProtocol conformer. This allows you to identify which button was pressed and handle the press accordingly. 
