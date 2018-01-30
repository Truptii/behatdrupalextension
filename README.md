
# Behat Drupal Extension

Drupal Extension in Behat is used to automate Drupal Backend(admin) scenarios. This repository will help in setting up Behat with Drupal Extension.

Below are the steps to setup Behat with Drupal Extension

1.Create your project folder
mkdir projectfolder
cd projectfolder  

2.Install composer curl -s https://getcomposer.org/installer | php

3.Require the dependancy for behat and drupal extension in your composer.json
 ``` 
 "require": {
    "drupal/drupal-extension": "~3.0",
},
```
  
4. Update the composer composer update

5. Proceed with behat installation by creating behat.yml file

6.Enable Drupal Extension by adding the extension in behat.yml
```
Drupal\DrupalExtension:
     blackbox: ~
     api_driver: 'drupal'
     drupal: 
       drupal_root: '/path to drupal'
 ```    
7.Initialize Behat by executing the command bin/behat --init . This will create FeatureContext.php file and features folder. In features folder you can create your own feature file to automation scripts using Gherkin. In FeatureContext.php you can create your own step definitions using PHP

8.Execute command bin/behat -dl to view list of all steps (This is also to ensure that your behat setup is done properly)

