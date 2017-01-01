# README

A tiny RESTful API to index a page's content. Supports h1, h2, h3, a tags.


## Installation

#### Install dependencies
```
$ bundle
```

#### Run database migrations
```
$ rails db:migrate
```

#### Run server
```
$ rails s
```

## Run

```
rails s
```

## Run Tests

```
rails test
```

## API

#### GET /pages

List all indexed pages.

Sample Response Payload:

```
[
  {
    "id": 1,
    "url": "http://alistapart.com/",
    "created_at": "2017-01-01T20:19:32.072Z",
    "updated_at": "2017-01-01T20:19:32.072Z",
    "contents": [
      {
        "id": 1,
        "tag": "h1",
        "body": "A List Apart",
        "href": null
      },
      ...
    ]
  }
]
```

#### POST /pages

Create and index a URL.

Sample Request Payload:
```
{
  "page": {
    "url": "http://alistapart.com/",
  }
}
```

### Others

* GET /pages/:page_id : Shows details for a single page
* DELETE /pages/:page_id : Delete page and its contents

### TODO

* PUT /pages/:page_id needs to refresh contents.
* Bulk insert contents instead of using separate queries.


## Author:

Poojan Shrestha <poojans@gmail.com>
