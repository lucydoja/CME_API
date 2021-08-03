# CME API

### Description
* This is a Continuing Medical Education (CME) requirements API. 
* Here you will be able to get all the requirements needed for every specialty and state on the list. This a fully Ruby on Rails based API. 
* The cointaining API information is property of [Board Vitals](https://www.boardvitals.com/) and it is being web-scraped from the [CME Coach Section](https://www.boardvitals.com/cme-coach).

### Versions
* Ruby version '2.5.0'
* Rails version '6.1.3.2'

### Configuration
* bundle install
* rails s

### Use
* Using a browser
  - Open your browser on the desired url
  - You will be able to visualize the results on the browser
* Using Postman or similar apps
  - Make a get request with the desired end-point
  - The results should appear on your screen 

### End-points / url
* To get all possible specialties use http://localhost:3000/api/v1/specialties
* To gel all possible states use http://localhost:3000/api/v1/states
* To get the requirements use the following format http://localhost:3000/api/v1/<specialty>/<state> 
  - Replace <specialty> with the desired specialty you want to consult and <state> with the desired state
  - For example: http://localhost:3000/api/v1/child-neurology/colorado

