# README

# Schema
![image](https://user-images.githubusercontent.com/78194232/160513335-768a6bab-cc45-43c4-bed1-79f9854a2a95.png)


# JSON Contract
```json

{
    "title": "User",
    "description": "A user",
    "type": "object",
    "properties": {
        "id": {
            "description": "A user's unique identifier",
            "type": "integer"
        },
        "name": {
            "description": "A user's name",
            "type": "string"
        },
        "email": {
            "description": "A user's email address",
            "type": "string",
            "format": "email"
        },
        "genre": {
            "description": "A user's musical genre",
            "type": "string"
        },
        "song_title": {
            "description": "A user's song title for their submitted video",
            "type": "string"
        },
        "type": {
            "description": "A user's role type, musician or admin",
            "type": "integer"
        },
        "selected": {
            "description": "A user's submission selected status",
            "type": "boolean"
        },
        "profile": {
            "description": "A user's profile photo",
            "type": "string",
            "contentMediaType": "image/*"
        },
        "video": {
            "description": "A user's submission video",
            "type": "string",
            "contentMediaType": "video/*"
        }
    },
    "required": [
        "id",
        "name",
        "email",
        "genre",
        "selected",
        "type",
        "profile",
        "video"
    ]
}
```
