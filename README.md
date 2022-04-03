![102184543](https://user-images.githubusercontent.com/89213429/161408284-969a518f-c8b7-4003-adbc-9509fffce797.png)
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
# The Troubadour Project - API 
![languages](https://img.shields.io/github/languages/top/Troubadour-Project/troubadour_be?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/Troubadour-Project/troubadour_be)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-7-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Visit the [Web Application](https://troubadour-fe.herokuapp.com/)  &   Find The Troubador Project - Web Application Repository [here](https://github.com/Troubadour-Project/troubadour-fe)
### Module 4 Group Capstone Project
Reference: [Turing Project Documentation](https://mod4.turing.edu/projects/capstone/index.html)

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#set-up">Set Up</a></li>
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

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:Troubadour-Project/troubadour_be.git`
2. Navigate to the newly cloned directory `$ cd troubadour_be`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

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

- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails)

- API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers), [graphql](https://github.com/rmosolgo/graphql-ruby), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993), [rack-cors](https://www.rubydoc.info/gems/rack-cors/0.4.0)
- Storage: [aws-sdk-s3](https://github.com/aws/aws-sdk-ruby)

### Database Schema
![image](https://user-images.githubusercontent.com/78194232/160707141-702122b5-f8e7-43bf-876d-530a280160a2.png)

# API 
## Troubadour Published API Documentation - [Postman](https://documenter.getpostman.com/view/19252156/UVyswb76)

<details>
    <summary> JSON Contract </summary>

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
    <summary> REST Query </summary>
    
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
    <summary> GraphQL Queries </summary>
    
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
    <summary> GraphQL Mutations </summary>
    
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
Description: Changes the winner boolean.*
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
    <td align="center"><a href="https://www.linkedin.com/in/aliroemhildt/"><img src="https://avatars.githubusercontent.com/u/90285501?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ali Roemhildt</b></sub></a><br /><a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=aliroemhildt" title="Documentation">📖</a> <a href="#design-aliroemhildt" title="Design">🎨</a> <a href="#ideas-aliroemhildt" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-aliroemhildt" title="Project Management">📆</a> <a href="https://github.com/Troubadour-Project/troubadour_be/pulls?q=is%3Apr+reviewed-by%3Aaliroemhildt" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/Troubadour-Project/troubadour_be/commits?author=aliroemhildt" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!