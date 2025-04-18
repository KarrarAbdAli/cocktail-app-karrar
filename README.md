# cocktail-app-karrar
NDE iOS Recruitment Task - Cocktail App

## Features

- List of cocktails (name + image)
- Clean SwiftUI interface
- `LoginView` to provide **Basic Auth credentials**
- Toggle to switch between **real API** and **mocked data**
- Async/await powered data fetching
- Architecture using **MVVM + protocol abstraction**
- Networking code is extracted into a **separate framework target (`CocktailKit`)**


---

## Architecture & Strategy

- **MVVM (Model-View-ViewModel)**: Views are clean and reactive, state is managed via `@ObservedObject`.
- **Protocol-Oriented Design**: All data fetching is abstracted through `CocktailFetchable`, making the app testable and easily switchable between mock and real services.
- **Modular Codebase**: 
  - The app target contains only UI and presentation logic.
  - All models and network logic are contained inside the `CocktailKit` framework.

---

