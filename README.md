# README

# Schema
![image](https://user-images.githubusercontent.com/78194232/160513335-768a6bab-cc45-43c4-bed1-79f9854a2a95.png)


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
        "profile": {
            "description": "A submission's profile photo",
            "type": "string",
            "contentMediaType": "image/*"
        },
        "video": {
            "description": "A submission's video",
            "type": "string",
            "contentMediaType": "video/*"
        }
        "profile_url": {
            "description": "A submission's profile photo url",
            "type": "string",
            "contentMediaType": "image/*"
        },
        "video_url": {
            "description": "A submission's video url",
            "type": "string",
            "contentMediaType": "video/*"
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
        },
    },
    "required": [
        "id",
        "name",
        "email",
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
        "selected": {
            "description": "A submission admin's selected status",
            "type": "boolean",
        },
    },
    "required": [
        "id",
        "admin_id",
        "submission_id",
        "selected"
    ]
}
```
