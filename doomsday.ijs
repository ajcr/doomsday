#!/usr/bin/ijconsole

NB. Compute the day of the week from a given date using Conway's Doomsday Rule
NB. Usage: ./doomsday.ijs YYYY MM DD
NB. Reference: https://en.wikipedia.org/wiki/Doomsday_rule

DAYS =: 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday',:'Saturday'

NB. months:  NA 01 02 03 04 05 06 07 08 09 10 11 12
DOOMSDAYS =: _1  3 28  0  4  9  6 11  8  5 10  7 12

truncdiv =: [: (* * <.@:|) %

integers =: 0".>,.2}.ARGV

year =: 0 { 0 { integers
month =: 0 { 1 { integers
day =: 0 { 2 { integers

NB. compute the anchor day for the century
NB. this is 5 × (y mod 4) mod 7 + Tuesday
anchor =. 2 + 7 | 5 * 4 | 100 truncdiv~ year

NB. compute the doomsday for the year of the century
NB. an alternative way is 7 | anchor + +/ 12 (truncdiv~ , | , truncdiv&4@:|) 100 | year
doomsday =: 7 | anchor + (+truncdiv&4) 100 | year

NB. lookup the day of the doomsday in the specified month
NB. for leap years, add 1 to January and February doomsdays
doomsdate =: month { DOOMSDAYS + (0 = 4 | year) *. (3 > month)

NB. the day of the week is given by counting forward/back from doomsday
echo DAYS {~ 7 | doomsday + day - doomsdate

exit''
