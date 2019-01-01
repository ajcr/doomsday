#!/usr/bin/ijconsole

NB. Compute the day of the week from a given date using Sakamoto's Method
NB. Usage: ./sakamoto.ijs YYYY MM DD
NB. Reference: https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Sakamoto's_methods

DAYS =: 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday',:'Saturday'

truncdiv =: [: (* * <.@:|) %

integers =: 0".>,.2}.ARGV

year =: 0 { 0 { integers
month =: 0 { 1 { integers
day =: 0 { 2 { integers

NB. for January and February, year is decremented
year =: year - month < 3

NB. the array on the right gives the day offset for each month
NB. (+/ year truncdiv 1 4 _100 400) offset the day to account for leap years
echo DAYS {~ 7 | (+/ year truncdiv 1 4 _100 400) + day + month { _1 0 3 2 5 0 3 5 1 4 6 2 4

exit''
