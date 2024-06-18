stages:
  - build
  - test
  - deploy

build:
  stage: build
  script:
    - echo 'Building the application...'
  tags:  
     - ci-server # Runnner In CI-Server will work
test:
  stage: test
  script:
    - echo 'Testing the application...'
  tags:
     - ci-server  r # Runnner In CI-Server will work
deploy:
  stage: deploy
  script:
    - echo 'Deploying the application...'
  tags:
    - deploy-server r # Runnner In Deploy-Server will work
