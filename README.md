# Financial Wellness App

## Table of Contents

- [Introduction](#introduction)
- [Flutter Version](#flutter-version)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Running Tests](#running-tests)
- [Additional Information](#additional-information)

## Introduction

The Financial Wellness App allows users to input their annual income and monthly costs, and it calculates a score to represent their financial wellness. The scores are classified as HEALTHY, AVERAGE, or UNHEALHY.

## Flutter Version

This project was developed using Flutter version `3.22.2`. Make sure you have this version installed before running the project.

To check your Flutter version, run:

```sh
flutter --version
```

## Project Structure

The project follows a layered architecture comprising four main layers:

1. **Data Layer**: Handles data sources, repositories, and data transfer objects (DTOs).
2. **Domain Layer**: Contains application-specific model classes that are immutable and include serialization logic.
3. **Application Layer**: Contains services that implement business logic and interact with repositories.
4. **Presentation Layer**: Manages the user interface and controllers for state management.

### Layers

#### Data Layer

- **Models**: Define the structure of the data (e.g., `FinancialInfoModel`).
- **Repositories**: Provide methods to access data sources and return data as model classes (e.g., `FinancialRepository`).
- **Data Sources**: Implement methods to communicate with external data sources (e.g., `LocalDataSource`).

#### Domain Layer

- **Entities**: Represent the core business objects (e.g., `FinancialInfo`).

#### Application Layer

- **Services**: Contain business logic and calculations (e.g., `FinancialService`).

#### Presentation Layer

- **Controllers**: Manage state and handle user interactions (e.g., `FinancialController`).
- **Views**: Build the user interface (e.g., `FinancialForm`).
- **Widgets**: Reusable components used in multiple views (e.g., `InputForm`).

## Installation

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate code for serialization.

## Usage

1. Enter your annual gross income and average monthly costs in the form.
2. Submit the form to view your financial health score.

## Running Tests

To run tests, use the command:

```bash
flutter test
```

## Additional Information

- This project was built using the iPhone simulator for development and testing.
- This project was built using VS Code and running in iOS Simulators using a Macbook machine.
- The financial_repository and local_data_source components are included for future expansion but are not currently utilized in the app.
- Make sure to configure your development environment accordingly.
