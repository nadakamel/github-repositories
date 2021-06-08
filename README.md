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

## Architecture

Model-View-ViewModel (MVVM) architecture + Routers
