# Public GitHub Repositories
Using this [Endpoint](https://api.github.com/repositories) to retrieve public GitHub repositories with search feature. When any repository is clicked, it opens a screen with more details about the repository.

## Base Tooling
- `ObjectMapper` to convert the model class objects to and from JSON.
- `Realm` for data offline caching (needed for pagination).

## Getting Started

### Prerequisites
This project uses cocoapods for dependencies management. If you don't have cocoapods installed in your machine, or are using older version of cocoapods, you can install it in terminal by running command ```sudo gem install cocoapods```. For more information go to https://cocoapods.org/

### Installation

1. Clone this repository to your machine in Xcode or using your machine's Terminal whatever you prefer.\
`git clone https://github.com/nadakamel/github-repositories.git`

2. Download CocoaPods on your machine if you don't already have it\
`sudo gem install cocoapods`

3. Install third-party libraries using `pod`\
`pod install`

### Usage
Open  ```GithubRepoList.xcworkspace``` and run the project.

## Architecture

Model-View-ViewModel (MVVM) architecture + Routers

## Screenshots
<img src="https://github.com/nadakamel/github-repositories/blob/main/Screenshots/HomeScreen.png" width="300" height="534"> <img src="https://github.com/nadakamel/github-repositories/blob/main/Screenshots/RepoDetailsScreen.png" width="300" height="534"> 

Search for public repositories by repository name..

<img src="https://github.com/nadakamel/github-repositories/blob/main/Screenshots/HomeSearchScreen.png" width="300" height="534">


