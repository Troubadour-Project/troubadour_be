
<p align="center" width="100%">
    <img width="55%" src="https://user-images.githubusercontent.com/78194232/161444100-d82d533f-bc5d-4996-b49d-9423a1f6a4bf.png" alt="Troubadour Logo">
</p>
<div align="center">

# The Troubadour Project - API

![languages](https://img.shields.io/github/languages/top/Troubadour-Project/troubadour_be?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/Troubadour-Project/troubadour_be)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![CircleCI](https://img.shields.io/circleci/build/gh/Troubadour-Project/troubadour_be/main)<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-7-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
</div>

## Visit the [Web Application](https://troubadour-fe.herokuapp.com/)  &   Find The Troubador Project - Web Application Repository [here](https://github.com/Troubadour-Project/troubadour-fe)
### Module 4 Group Capstone Project
Reference: [Turing Project Documentation](https://mod4.turing.edu/projects/capstone/index.html)

<details open="open">
  <summary><b>Table of Contents</b></summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#general-setup">General Setup</a></li>
        <li><a href="#basic-aws-s3-setup">Basic AWS S3 Setup</a></li>
        <li><a href="#use-of-this-repository">Use of this Repository</a>
        </li>
    </li>
    </ul>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
        <li><a href="#versions">Versions</a></li>
        <li><a href="#important-gems">Important Gems</a></li>
        <li><a href="#database-schema">Database Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#api">API</a>
      <details>
        <summary>Available Documentation</summary>
        <ul>
          <li>Postman Documentation</li>
          <li>JSON Contract</li>
          <li>REST Endpoint Example</li>
          <li>GraphQL Query Examples</li>
          <li>GraphQL Mutation Examples</li>
        </ul>
      </details>
    </li>
    <li><a href="#collaborators">Collaborators</a></li>
  </ol>
</details>

----------

## Getting Started

### General Setup
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:Troubadour-Project/troubadour_be.git`
2. Navigate to the newly cloned directory `$ cd troubadour_be`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists


### Basic AWS S3 Setup
1. To setup environmental variables, an Amazon Web Services account will be required for utilizing the Active Storage functionality. Begin by signing up for AWS `https://aws.amazon.com/`.
2. After signing up for an account, create two S3 (Simple Storage Service) buckets, one for production use, and one for development. Default settings are fine for our use.
3. If setting up the Troubadour Backend with our Troubadour FE, CORS Permissions will need to be setup with the S3 buckets. Below is an example and should be modified for your use.
```json
[
    {
        "AllowedHeaders": [
            "*"
        ],
        "AllowedMethods": [
            "GET",
            "PUT",
            "POST",
            "DELETE"
        ],
        "AllowedOrigins": [
            "https://your.site.url.com"
        ],
        "ExposeHeaders": []
    }
]
```
4. Next, for insulating your root user credentials from the app and to promote Privilege of Least Principles, create a new IAM user with Programmatic Access. As well it is advised to create a new user group with privileges for just utilizing your S3 storage.
5. After setup of your buckets, back in your project directory we will now be saving our credentials utilizing the [Figaro Gem](https://github.com/laserlemon/figaro) by running the following command from the terminal. This command will create a new file `config/application.yml` and append the file to your `.gitignore` to prevent uploading to a remote service.
```zsh
$ bundle exec figaro install
```
6. Using your new IAM user credentials fill in `application.yml` file with the user's AWS Access Key ID, Secret Access Key, region, and the production and development bucket names. After this your AWS S3 ActiveStorage setup is complete.
```yml
# Amazon S3 Configuration
aws_s3_access_key_id: "your_access_key_id_here"
aws_s3_secret_access_key: "your_secret_access_key_id_here"
aws_s3_region: "your_s3_bucket_region_here"
aws_s3_bucket_prod: "your_production_bucket_name_here"
aws_s3_bucket_dev: "your_development_bucket_name_here"
```
7. With S3 setup, you may now run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

----------

### Use of this Repository

**API**
 
On your command line:
1. Navigate to the local directory where the backend repo is housed
2. Run `$ rails s` to run the server locally
3. Open a web browser and navigate to http://localhost:3001/graphiql
4. Here you are able to explore the endpoints exposed by the GraphQL API! 

----------

## Project Description

This is a Full-Stack project designed to explore the fundamentals of exposing and consuming an API in order to develop an app that integrates microservices. Troubadour supports concert and festival venues that host contests for aspiring musicians. Musicians can submit their auditions complete with a profile image and video to be favorited by admin staff in hopes of being selected as the overall winner. Functionality is achieved by combining a postgreSQL database with Rails ActiveStorage and Amazon S3 to create the Troubadour API behind the frontend submission-based contest platform.

### Learning Goals for Project:

- Use an agile process
- Building GraphQL API
- Video and Image upload through ActiveStorage and Amazon S3
- Practice a professional git workflow 
- Implement continuous integration and deployment
- Communication between front-end and back-end teams to meet and deploy the MVP

----------

### Versions

- `Ruby 2.7.2`
- `Rails 6.1.5`

----------

### Important Gems

- Testing:  [rspec-rails](https://github.com/rspec/rspec-rails),  [simplecov](https://github.com/simplecov-ruby/simplecov),  [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails),  [faker](https://github.com/vajradog/faker-rails),  [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers),  [pry](https://github.com/pry/pry),  [rspec_junit_formatter](https://github.com/sj26/rspec_junit_formatter),  [graphiql-rails](https://github.com/rmosolgo/graphiql-rails)

- API:  [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers),  [graphql](https://github.com/rmosolgo/graphql-ruby),  [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993),  [rack-cors](https://www.rubydoc.info/gems/rack-cors/0.4.0)

- Storage:  [aws-sdk-s3](https://github.com/aws/aws-sdk-ruby)

### Database Schema
![image](https://user-images.githubusercontent.com/78194232/160707141-702122b5-f8e7-43bf-876d-530a280160a2.png)

# API 
## Troubadour Published API Documentation - [Postman](https://documenter.getpostman.com/view/19252156/UVyswb76)

<details>
  <summary><b>JSON Contract</b></summary>

```json

{
    "title": "Submission",
    "description": "A submission",
    "type": "object",
    "properties": {
        "id": {
            "description": "A user's unique identifier",
            "type": "integer"
        },
        "name": {
            "description": "A submission's name",
            "type": "string"
        },
        "email": {
            "description": "A submission's email address",
            "type": "string",
            "format": "email"
        },
        "genre": {
            "description": "A submission's musical genre",
            "type": "string"
        },
        "song_title": {
            "description": "A submission's song title for their submitted video",
            "type": "string"
        },
        "winner": {
            "description": "A submission's winner status",
            "type": "boolean"
        },
        "profile": {
            "description": "A submission's profile photo",
            "type": "string",
            "contentMediaType": "image/*"
        },
        "video": {
            "description": "A submission's video",
            "type": "string",
            "contentMediaType": "video/*"
        },
        "profile_url": {
            "description": "A submission's profile photo url",
            "type": "string",
        },
        "video_url": {
            "description": "A submission's video url",
            "type": "string",
        }
    },
    "required": [
        "id",
        "name",
        "email",
        "genre",
        "profile",
        "video"
    ]
},
{
    "title": "Admin",
    "description": "A admin user",
    "type": "object",
    "properties": {
        "id": {
            "description": "A admin's unique identifier",
            "type": "integer"
        },
        "username": {
            "description": "A admin's name",
            "type": "string"
        },
        "email": {
            "description": "A submission's email address",
            "type": "string",
            "format": "email"
        }
    },
    "required": [
        "id",
        "username",
        "email"
    ]
},
{
    "title": "Submission_Admin",
    "description": "A submission's admin ",
    "type": "object",
    "properties": {
        "id": {
            "description": "A submission admin's unique identifier",
            "type": "integer"
        },
        "admin_id": {
            "description": "A submission admin's admin id",
            "type": "integer"
        },
        "submission_id": {
            "description": "A submission admin's submission id",
            "type": "integer",
        },
        "favorite": {
            "description": "A submission admin's favorite status",
            "type": "boolean",
        },
    },
    "required": [
        "id",
        "admin_id",
        "submission_id",
        "favorite"
    ]
}
```
</details>

<details>
  <summary><b>REST Query</b></summary>
    
## Create Submission
Description: Create a new submission by adding user information and uploading a profile and video in the form fields. 
### Sample Request `post \api\v1\submissions`
    
```form-data
{ submission: {
    name: "User",
    email: "sample@email.com",
    genre: "Bluegrass",
    song_title: "Turing",
    profile: "<Add your image to form field>",
    video: "<Add your submission video to form field>"
    }
 }
 ```
 ### Sample Response 
    
 ```json
 {
    "data": {
        "id": "3",
        "type": "submissions",
        "attributes": {
            "name": "User",
            "email": "sample@email.com",
            "song_title": "Turing",
            "genre": "Bluegrass",
            "video": {
                "name": "video",
                "record": {
                    "id": 3,
                    "name": "User",
                    "email": "sample@email.com",
                    "genre": "Bluegrass",
                    "song_title": "Turing",
                    "created_at": "2022-03-31T15:40:40.464Z",
                    "updated_at": "2022-03-31T15:40:40.694Z",
                    "winner": null
                }
            },
            "profile": {
                "name": "profile",
                "record": {
                    "id": 3,
                    "name": "User",
                    "email": "sample@email.com",
                    "genre": "Bluegrass",
                    "song_title": "Turing",
                    "created_at": "2022-03-31T15:40:40.464Z",
                    "updated_at": "2022-03-31T15:40:40.694Z",
                    "winner": null
                }
            },
            "winner": null
        }
    }
}
```
### Sample Invalid Response
```json
{
    "errors": "Validation failed: Name can't be blank, Email can't be blank, Genre can't be blank, Song title can't be blank"
}
```
 </details>
    
<details>
  <summary><b>GraphQL Queries</b></summary>
    
## getAdmin
Description: Get admin by admin id. If there is a match, return requested field values. Otherwise return null.
    <details>
    <summary> Sample Request </summary>
        
```graphql
{
  getAdmin(id: Integer) {
    id
    username
    email
    submissions {
      id
      name
      email
      genre
      songTitle
      winner
      profileUrl
      videoUrl
      adminFavorite(adminId: Integer)
    }
  }
}
```
</details>
<details>
    <summary> Sample Valid Response </summary>

```json
{
  "data": {
    "getAdmin": {
      "id": "1",
      "username": "admin1",
      "email": "sherman_heidenreich@kessler-lynch.org",
      "submissions": [
        {
          "id": "1",
          "name": "sub1",
          "email": "joan.pfannerstill@friesen.biz",
          "genre": "sit",
          "songTitle": "eum",
          "winner": false,
          "profileUrl": "https://troubadour...",
          "videoUrl": "https://troubadour...",
          "adminFavorite": true
        },
        {
          "id": "2",
          "name": "sub2",
          "email": "kurt.parisian@berge-kerluke.com",
          "genre": "sequi",
          "songTitle": "iusto",
          "winner": false,
          "profileUrl": "https://troubadour...",
          "videoUrl": "https://troubadour...",
          "adminFavorite": false
        },
        {...
        }
      ]
    }
  }
}
```
</details>
<details>
    <summary> Sample Invalid Response </summary>

```json
{
  "data": {
    "getAdmin": null
  },
  "errors": [
    {
      "message": "Admin does not exist",
      "locations": [
        {
          "line": 2,
          "column": 3
        }
      ],
      "path": [
        "getAdmin"
      ]
    }
  ]
}
```
</details>
    
## getSubmission
Description: Get submission by submission id. If there is a match, return requested field values. Otherwise return null.
<details>
    <summary> Sample Request </summary>
    
```graphql
{
  getSubmission(id: Integer) {
    id
    name
    email
    genre
    songTitle
    winner
    profileUrl
    videoUrl
    adminFavorite(adminId: Integer)
  }
}
```
</details>
<details>
    <summary> Sample Valid Response </summary>

```json
{
  "data": {
    "getSubmission": {
      "id": "1",
      "name": "sub1",
      "email": "joan.pfannerstill@friesen.biz",
      "genre": "sit",
      "songTitle": "eum",
      "winner": false,
      "profileUrl": "https://troubadour...",
      "videoUrl": "https://troubadour...",
      "adminFavorite": true
    }
  }
}
```
</details>
<details>
    <summary> Sample Invalid Response </summary>
```json
{
  "data": null,
  "errors": [
    {
      "message": "Submission does not exist",
      "locations": [
        {
          "line": 2,
          "column": 3
        }
      ],
      "path": [
        "getSubmission"
      ]
    }
  ]
}
```
</details> 

## getSubmissions
Description: Get array of all submissions and their fields.
<details>
    <summary> Sample Request </summary>
    
```graphql
{
  getSubmissions {
    id
    name
    email
    genre
    songTitle
    winner
    profileUrl
    videoUrl
    adminFavorite(adminId: 1)
  }
}
```
</details> 
<details>
    <summary> Sample Response </summary>

```json
{
  "data": {
    "getSubmissions": [
      {
        "id": "5",
        "name": "sub5",
        "email": "deidre@balistreri-mclaughlin.info",
        "genre": "quod",
        "songTitle": "quia",
        "winner": false,
        "profileUrl": "https://troubadour...",
        "videoUrl": "https://troubadour...",
        "adminFavorite": false
      },
      {
        "id": "4",
        "name": "sub4",
        "email": "dulce_abshire@witting-abbott.org",
        "genre": "quidem",
        "songTitle": "laborum",
        "winner": false,
        "profileUrl": "https://troubadour...",
        "videoUrl": "https://troubadour...",
        "adminFavorite": false
      },
      {...
      }
    ]
  }
}
```
</details>

## getWinner
Description: Get the winning submission. If there is a match, return requested field values. Otherwise return null.
<details>
    <summary> Sample Request </summary>
    
```graphql
{
  getWinner {
    id
    name
    email
    genre
    songTitle
    winner
    profileUrl
    videoUrl
    adminFavorite(adminId: 1)
  }
}
```
</details>
<details>
    <summary> Sample Valid Response </summary>

```json
{
  "data": {
    "getWinner": {
      "id": "1",
      "name": "sub1",
      "email": "joan.pfannerstill@friesen.biz",
      "genre": "sit",
      "songTitle": "eum",
      "winner": true,
      "profileUrl": "https://troubadour...",
      "videoUrl": "https://troubadour...",
      "adminFavorite": true
    }
  }
}
```
</details>
<details>
    <summary> Sample Invalid Response </summary>
```json
{
  "data": {
    "getWinner": null
  }
}
```
</details>
</details>

<details>
  <summary><b>GraphQL Mutations</b></summary>
    
## favoriteSubmissionAdmin 
Description: Changes the favorite boolean on SubmissionAdmin from true to false/false to true
<details>
    <summary> Sample Request </summary>

```graphql
mutation {
  favoriteSubmissionAdmin(input: {submission_id: Integer, admin_id: Integer}) {
    submissionAdmin {
      id
      submissionId
      adminId
      favorite
    }
  }
}

```
</details>
<details>
    <summary> Sample Valid Response </summary>

```json
{
  "data": {
    "favoriteSubmissionAdmin": {
      "submissionAdmin": {
        "id": "1",
        "submissionId": 3,
        "adminId": 1,
        "favorite": true,
      }
    }
  }
}
```
</details>

## updateWinner
Description: Changes the winner boolean.
<details>
    <summary> Sample Request </summary>

```graphql
mutation {
  updateWinner(input: {id: Integer, winner: Boolean}) {
    submission {
      id
      name
      email
      genre
      songTitle
      winner
    }
  }
}

```
</details>

<details>
    <summary> Sample Valid Response </summary>

```json
{
  "data": {
    "updateWinner": {
      "submission": {
        "id": "1",
        "name": "sub1",
        "email": "silas.raynor@wisoky.name",
        "genre": "accusantium",
        "songTitle": "reprehenderit",
        "winner": true
      }
    }
  }
}
```
*Note: Submission's winner boolean is set to false by default
</details>
</details>



## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/arnaldoaparicio"><img src="https://avatars.githubusercontent.com/u/88012780?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Arnaldo Aparicio</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=arnaldoaparicio" title="Documentation">📖</a> <a href="#design-arnaldoaparicio" title="Design">🎨</a> <a href="#ideas-arnaldoaparicio" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-arnaldoaparicio" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3Aarnaldoaparicio" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=arnaldoaparicio" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/oacortez"><img src="https://avatars.githubusercontent.com/u/61717746?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Oscar Cortez Barrientos</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=oacortez" title="Documentation">📖</a> <a href="#design-oacortez" title="Design">🎨</a> <a href="#ideas-oacortez" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-oacortez" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3Aoacortez" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=oacortez" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/Echory"><img src="https://avatars.githubusercontent.com/u/81824035?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Echory</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=Echory" title="Documentation">📖</a> <a href="#design-Echory" title="Design">🎨</a> <a href="#ideas-Echory" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-Echory" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3AEchory" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=Echory" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/mr-ryan12"><img src="https://avatars.githubusercontent.com/u/62816754?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ryan McBride</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=mr-ryan12" title="Documentation">📖</a> <a href="#design-mr-ryan12" title="Design">🎨</a> <a href="#ideas-mr-ryan12" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-mr-ryan12" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3Amr-ryan12" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=mr-ryan12" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/tjroeder"><img src="https://avatars.githubusercontent.com/u/78194232?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Tim Roeder</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=tjroeder" title="Documentation">📖</a> <a href="#design-tjroeder" title="Design">🎨</a> <a href="#ideas-tjroeder" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-tjroeder" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3Atjroeder" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=tjroeder" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://www.linkedin.com/in/aliroemhildt/"><img src="https://avatars.githubusercontent.com/u/90285501?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ali Roemhildt</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=aliroemhildt" title="Documentation">📖</a> <a href="#design-aliroemhildt" title="Design">🎨</a> <a href="#ideas-aliroemhildt" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-aliroemhildt" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3Aaliroemhildt" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=aliroemhildt" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/Sierra-T-9598"><img src="https://avatars.githubusercontent.com/u/89213429?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Sierra Tucker</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=Sierra-T-9598" title="Documentation">📖</a> <a href="#design-Sierra-T-9598" title="Design">🎨</a> <a href="#ideas-Sierra-T-9598" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-Sierra-T-9598" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3ASierra-T-9598" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=Sierra-T-9598" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
