# README

# Schema
![image](https://user-images.githubusercontent.com/78194232/160707141-702122b5-f8e7-43bf-876d-530a280160a2.png)


# JSON Contract
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
# REST Query 
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
# GraphQL Queries
## getAdmin
Description: Get admin by admin id. If there is a match, return requested field values. Otherwise return null.
### Sample Request
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
### Sample Valid Response
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
### Sample Invalid Response
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
## getSubmission
Description: Get submission by submission id. If there is a match, return requested field values. Otherwise return null.
### Sample Request
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
### Sample Valid Response
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
### Sample Invalid Response
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
## getSubmissions
Description: Get array of all submissions and their fields.
### Sample Request
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
### Sample Response
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
## getWinner
Description: Get the winning submission. If there is a match, return requested field values. Otherwise return null.
### Sample Request
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
### Sample Valid Response
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
### Sample Invalid Response
```json
{
  "data": {
    "getWinner": null
  }
}
```
# GraphQL Mutations
## updateWinner
Description: Changes the winner boolean.*
### Sample Request
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

### Sample Valid Response
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
