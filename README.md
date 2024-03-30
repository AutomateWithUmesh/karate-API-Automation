# karate-API-Automation
# API Testing Framework

This repository contains an API testing framework built using Karate.

## Introduction

This framework is designed to facilitate automated testing of APIs, specifically focusing on testing endpoints related to user roles. It includes features for obtaining access tokens, fetching user roles, and validating API responses.

## Structure

The framework is organized as follows:

- **src/test/java/config/**: Contains configuration files, such as credentials and user details.
  - `credentials.json`: Holds client IDs and secrets for accessing APIs.
  - `userDetailsForGetRoles.csv`: Provides usernames for fetching roles.

- **src/test/java/helpers/**: Contains helper feature files.
  - `getRoles_accessToken.feature`: Obtains access tokens for API authorization.

- **src/test/java/itgAPI/feature/**: Contains feature files for testing APIs.
  - `getRoles.feature`: Tests the Get Roles API functionality.

## Setup

1. Replace placeholders like `<<client id>>`, `<<secret key>>`, `<<userName1>>`, `<<path>>`, `apiURL`, etc., in the configuration files with appropriate values.

2. Ensure dependencies are installed. [Karate](https://github.com/intuit/karate) is required for running the tests.

## Running Tests

To run the tests, execute the following steps:

1. Navigate to the root directory of the project.
2. Run the tests using the following command:
