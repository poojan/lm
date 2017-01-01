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


#### POST /pages

Create and index a URL.

Sample Request Payload:
```
{
  "page": {
    "url": "..."
  }
}
```

### Others

GET /pages/:page_id : Shows details for a single page
DELETE /pages/:page_id : Delete page and its contents

### TODO

* PUT /pages/:page_id needs to refresh contents.

* Bulk insert contents instead of using separate queries.


## Author:

Poojan Shrestha <poojans@gmail.com>
