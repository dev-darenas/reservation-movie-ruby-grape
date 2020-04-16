## INSTALL AND RUN APP

This project run with ruby 2.6.3p62 and use postgresql, first you need to update the database.yml credentials. This file is in the config folder.

## Rake to create db

```
  rake db:create  
  rake db:migrate  
  rake db:drop  
```

## Run app
 
After run this command you can use de API in the port 9292

```
  rackup
```

# API DOC

1. 
DESCIRPTION: Create a new movie.  
TYPE: POST.  
URL: http://localhost:9292/api/v1/movies 
PARAMS:  
```
  {
    name: 'Fast and Furious',
    description: 'is an American media franchise centered on a series of action films that are largely concerned with illegal street racing, heists and spies.',
    image_url: 'https://pbs.twimg.com/profile_images/808736180074348545/tqHuSfTj_400x400.jpg',
    start_date: 01/03/2020,
    end_date: 25/03/2020
  }
````
REQUIRED: ['name', 'start_date', 'end_date']  
STATUS: 201  
RESPONSE:

````
{
    "id": 2,
    "name": "some 2",
    "description": "some",
    "image_url": "http://some.com/some",
    "start_date": "2020-04-20",
    "end_date": "2020-04-30"
}
````

2. 
DESCIRPTION: Get movies available in a determinate day.  
TYPE: GET.  
URL: http://localhost:9292/api/v1/movies  
PARAMS:   
```
  {
    date: 01/04/2020
  }
````
REQUIRED: []  
STATUS: 201  
RESPONSE:

````
  [
    {
        "id": 1,
        "name": "some",
        "description": "some",
        "image_url": "http://some.com/some",
        "start_date": "2020-04-20",
        "end_date": "2020-04-30"
    },
    {
        "id": 2,
        "name": "some 2",
        "description": "some",
        "image_url": "http://some.com/some",
        "start_date": "2020-04-20",
        "end_date": "2020-04-30"
    }
  ]
````

3. 
DESCIRPTION: Create reservation to a movie.  
TYPE: POST.  
URL: http://localhost:9292/api/v1/reservations  
PARAMS:   
```
  {
    reservation_date: '2020-04-29',
    movie_id: 5,
    customer: {
      email: 'darenas+1@softdreams.co',
      identification: '11455783'
      name: 'Camila lozano'
    }
  }
````
REQUIRED: ['reservation_date', 'movie_id', 'customer']  
STATUS: 201  
RESPONSE:

````
{
  "id": 13,
  "movie_id": 2,
  "customer_id": 1,
  "reservation_date": "2020-04-29"
}
````

3. 
DESCIRPTION: Get reservations in a range of dates.  
TYPE: GET.  
URL: http://localhost:9292/api/v1/reservations    
PARAMS:    
```
  {
    start_date: '2020-04-25',
    end_date: '2020-04-30'
  }
````
REQUIRED: ['start_date', 'end_date']    
RESPONSE:  

````
  [
    {
        "id": 3,
        "movie_id": 1,
        "customer_id": 1,
        "reservation_date": "2020-04-29"
    },
    {
        "id": 4,
        "movie_id": 1,
        "customer_id": 1,
        "reservation_date": "2020-04-29"
    }
  ]
````

**NOTE**: Date format is ´YYYY/MM/DD´
