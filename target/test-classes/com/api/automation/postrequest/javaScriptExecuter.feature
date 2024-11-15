Feature: To execute the java script function

  Scenario: Execute java script function with or withput parameter
    * def getIntValue = function() { return 10; }
    Then print "Function value ==>", getIntValue()
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    Then print "Function value ==>", getRandomValue()
    * def getStringValue = function(arg1) { return "Hello" + arg1; }
    Then print "Function value ==>", getStringValue(" World")