<h1 align="center">API Testing Framework</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Built%20with-Karate-orange" alt="Built with Karate">
</p>

<p align="center">
  <strong>Automated testing framework for APIs using Karate</strong>
</p>

## 🚀 Introduction

Welcome to the API Testing Framework! This repository houses a comprehensive framework designed to streamline the process of testing APIs. It leverages the power of Karate to provide a robust and efficient testing solution.

## 📁 Structure

The framework is organized into the following directories:

- **config/**: Contains configuration files for API endpoints and credentials.
- **helpers/**: Includes helper feature files for obtaining access tokens and other utilities.
- **itgAPI/feature/**: Holds feature files for testing different aspects of the API.
- **itgAPI/**: Contains Java files for running Karate tests.

## 🧐 Code Explanation

### 1. config/credentials.json

This file contains sensitive information such as client IDs and secrets required for accessing the APIs. Here's what each key represents:

- **getRolesAPI**: Contains client ID and client secret for the "getRolesAPI".
  - **clientId**: The client ID required for authentication.
  - **clientSecret**: The secret key required for authentication.

- **assignRevokeRolesAPI**: Contains client ID and client secret for the "assignRevokeRolesAPI".

### 2. config/userDetailsForGetRoles.csv

This CSV file contains a list of usernames. These usernames are likely used as parameters in API requests to fetch roles associated with each user. The file structure is simple, with one column named "userName" and each row containing a username.

### 3. helpers/getRoles_accessToken.feature

This feature file is responsible for obtaining an access token required for authorization to access the Get Roles API. Let's break down the scenario:

- **Feature**: Generate getRolesAPI access token
- **Background**: Sets up common steps for scenarios.
  - **apiName**: Variable to store the API name.
  - **authTokenResponse**: Calls a JavaScript function `karate.callSingle('classpath:karate-config.js', apiName)` to obtain the authorization token response.

- **Scenario**: Obtains access token for the getRolesAPI
  - **Given**: Defines the API URL and path.
  - **Given**: Sets the Content-Type header.
  - **Given**: Sets the Authorization header using the `authTokenResponse`.
  - **And**: Sets the grant_type parameter.
  - **When**: Makes a POST request.
  - **Then**: Verifies the status code is 200.
  - **And**: Stores the access token from the response.

### 4. itgAPI/feature/getRoles.feature

This feature file tests the Get Roles API functionality. Let's break down the scenario:

- **Feature**: Validate Get Roles API

- **Background**: Sets up common steps for scenarios.
  - **accessTokenResponse**: Calls the `getRoles_accessToken.feature` file to obtain the access token.

- **@debug**
  - **Scenario Outline**: Tests the API response with valid user data.
    - **Given**: Defines the API URL and path, including parameters like `<userName>`.
    - **And**: Sets query parameters.
    - **And**: Sets the Authorization header using the `access_token`.
    - **When**: Makes a GET request.
    - **Then**: Verifies the status code is 200.

- **Examples**: Data table for different usernames to test the scenario.

### 5. itgAPI/itgAPITest.java

This Java class contains a method annotated with `@Karate.Test`, which serves as an entry point for running Karate tests. It runs all Karate tests relative to the class.

### 6. karate-config.js

This JavaScript file defines a function `fn(apiName)` used to configure API-specific settings like API URLs and credentials based on the environment (dev or qa). It also includes a function to generate a base64-encoded token for HTTP basic authentication.

### 7. logback-test.xml

This XML file configures logging settings for Karate tests. It defines appenders for logging to the console and a file, and sets the log level for the `com.intuit` package to DEBUG.

## ⚙️ Setup

1. Clone this repository to your local machine.
2. Navigate to the root directory of the project.
3. Replace placeholders in the configuration files (`credentials.json`, `userDetailsForGetRoles.csv`) with appropriate values.
4. Ensure you have all necessary dependencies installed, including [Karate](https://github.com/intuit/karate).

## 🧪 Running Tests

To execute the tests, follow these steps:

1. Open a terminal and navigate to the project directory.
2. Run the tests using Maven:
