# [State and Data Flow](https://developer.apple.com/documentation/swiftui/state-and-data-flow)

## What
    Control and respond to the flow of data and changes within your app’s models.
## Why
- Help maintain a single source of truth by reducing the amount of glue logic you write.
- Automatically update affected views as needed(view binding) and support data binding.
## How
- Create a local view state: 
    - Wrap value type as [State](https://developer.apple.com/documentation/swiftui/state) properties
    - Instantiate an observable object directly in a view using a [StateObject](https://developer.apple.com/documentation/swiftui/stateobject)
- Connect to external [ObservableObject](https://developer.apple.com/documentation/Combine/ObservableObject) protocol 
    - Use the [ObservedObject](https://developer.apple.com/documentation/swiftui/observedobject) property wrapper
    - Access to an observable object stored in the environment using the [EnvironmentObject](https://developer.apple.com/documentation/swiftui/environmentobject) property wrapper
   
- Share a reference to a source of truth — like state or an observable object — using the [Binding](https://developer.apple.com/documentation/swiftui/binding) property wrapper.

- Distribute value data throughout your app by storing it in the [Environment](https://developer.apple.com/documentation/swiftui/environment).

- Pass data up through the view hierarchy from child views with a [PreferenceKey](https://developer.apple.com/documentation/swiftui/preferencekey).

- Manage persistent data stored with Core Data using a [FetchRequest](https://developer.apple.com/documentation/swiftui/fetchrequest).

## Property wrapper

@State - Creates an observable value

@Binding - Reference to a source of truth

@StateObject - Creates an observable object

@ObservedObject - Reference to observable object with an explicit injection chain

@EnvironmentObject - Reference to observable objectsupplied by a parent or ancestor view

Source: https://developer.apple.com/documentation/swiftui/state-and-data-flow
