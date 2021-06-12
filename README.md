# Public GitHub Repositories
Using this [Endpoint](https://api.github.com/repositories) to retrieve public GitHub repositories with search feature. When any repository is clicked, it opens a screen with more details about the repository.

- Each list item shows the following:
   - Repository name
   - Repository owner name
   - Avatar (Image) of the repository owner
   - Creation date

- Search for repositories matching at least 2 characters in the repo name.

- Each repository details shows the following:
   - Repo Github URL
   - Repo Description
   - Number of branches (showing branches names)
   - Number of commits
   - Number of tags
   - Number of contributors (showing their name and avatar)

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
<img src="https://github.com/nadakamel/github-repositories/tree/main/Screenshots/HomeScreen.png" width="300" height="534"> <img src="https://github.com/nadakamel/github-repositories/blob/main/Screenshots/RepoDetailsScreen.png" width="300" height="534"> 

